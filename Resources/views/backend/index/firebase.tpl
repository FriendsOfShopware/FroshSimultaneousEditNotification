{block name="backend/base/header/javascript" append}
{config name="firebaseConfiguration"}
<script>
var defaultDatabase = firebase.database();
var backendRef = defaultDatabase.ref('backend/' + userName);
var noticeElements = {};

defaultDatabase.ref().on('value', function (value) {
    var fireData = value.val();

    if (fireData) {
        fireData = fireData.backend;
        var activeWindows = Shopware.app.WindowManagement.getActiveWindows();
        var foundNotice = {};

        activeWindows.forEach(function (window) {
            var detail = getWindowDetails(window);

            if (detail) {
                Object.keys(fireData).forEach(function (user) {
                    if (user !== userName) {
                        Object.keys(fireData[user]).forEach(function (windowId) {
                            var noticeId = windowId + user;
                            foundNotice[noticeId] = true;
                            if (detail.id === windowId) {
                                if (!noticeElements.hasOwnProperty(noticeId)) {
                                    var msg = '{s name="noticeUserEditingSameContent"}Dieser Eintrag wird gerade vom Benutzer "[0]" bearbeitet{/s}';
                                    noticeElements[noticeId] = Shopware.Notification.createBlockMessage(Ext.String.format(msg, user), 'notice');
                                    detail.view.insert(0, noticeElements[noticeId]);
                                }
                            }
                        });
                    }
                });
            }
        });

        Object.keys(noticeElements).forEach(function (noticeId) {
            if (!foundNotice.hasOwnProperty(noticeId)) {
                noticeElements[noticeId].destroy();
                delete noticeElements[noticeId];
            }
        });
    }
});


function getWindowDetails(window) {
    var data = false;
    switch (window.$className) {
        case 'Shopware.apps.Customer.view.detail.Window':
            if (!window.record) {
                return false;
            }

            data = {
                id: 'customer_detail_' + window.record.get('id'),
                recordId: window.record.get('id'),
                type: 'customer_detail',
                user: userName,
                time: new Date(),
                view: window.detailForm
            };
            break;
        case 'Shopware.apps.Order.view.detail.Window':
            if (!window.record) {
                return false;
            }

            data = {
                id: 'order_detail_' + window.record.get('id'),
                recordId: window.record.get('id'),
                type: 'order_detail',
                user: userName,
                time: new Date(),
                view: window.down('order-overview-panel')
            };

            break;

        case 'Shopware.apps.Article.view.detail.Window':
            if (!window.article) {
                return false;
            }

            data = {
                id: 'article_' + window.article.get('id'),
                recordId: window.article.get('id'),
                type: 'article',
                user: userName,
                time: new Date(),
                view: window.down("[name='detail-form']")
            };

            break;

        case 'Shopware.apps.Emotion.view.detail.Window':
            if (!window.emotion || !window.emotion.get('id')) {
                return false;
            }

            // It seems to be, that emotion view's will be later deleted
            if (typeof window.hasFixEvent === 'undefined') {
                window.on('close', function () {
                    delete window.emotion;
                });
                window.hasFixEvent = true;
            }

            data = {
                id: 'emotion_' + window.emotion.get('id'),
                recordId: window.emotion.get('id'),
                type: 'emotion',
                user: userName,
                time: new Date(),
                view: window.down("[alias='widget.emotion-detail-settings']")
            };

            break;
    }

    return data;
}

setInterval(function () {
    var activeWindows = Shopware.app.WindowManagement.getActiveWindows(),
        backendData = [];

    activeWindows.forEach(function (window) {
        var detail = getWindowDetails(window);

        if (detail) {
            var firebaseRecord = detail;
            delete firebaseRecord.view;
            backendData[firebaseRecord.id] = firebaseRecord;
        }
    });

    backendRef.set(backendData);
}, 2000);

window.onbeforeunload = function () {
    backendRef.set({});
};

</script>
{/block}