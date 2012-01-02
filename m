Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RhmCA-00013G-Br
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jan 2012 13:01:14 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RhmC3-0000t4-U3
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2012 13:01:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RhmC2-00019e-Sr
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2012 13:01:07 -0500
Received: from mail-yx0-f173.google.com ([209.85.213.173]:35157)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RhmBy-00018o-Eh; Mon, 02 Jan 2012 13:01:02 -0500
Received: by yenm6 with SMTP id m6so10102477yen.4
	for <multiple recipients>; Mon, 02 Jan 2012 10:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=uYRvLKVjdSqXooPLM8Wpp6LlNUJuDhGn9Js0lMTt9q0=;
	b=R/qSZbZAFCLtWJd0cYOVDbMAB01qjgo42YT7lziMaoK65ua48jOKjjY4+nVnY6tBbl
	r6hbxyNTUWSu7aSNWW7OctiDp+LjKZf1yXObq9oaenJ322r+ucJzEBUvDjG/Be5Cg+7i
	/cMyIYoomIF4YtO90CBO1u2mOxY1+tUxSXlBQ=
Received: by 10.236.82.74 with SMTP id n50mr34490566yhe.117.1325527261931;
	Mon, 02 Jan 2012 10:01:01 -0800 (PST)
Received: from localhost.localdomain
	(host167-160-dynamic.2-87-r.retail.telecomitalia.it. [87.2.160.167])
	by mx.google.com with ESMTPS id u47sm70078488yhl.0.2012.01.02.10.00.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Jan 2012 10:01:01 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 Jan 2012 19:00:30 +0100
Message-Id: <1325527237-24146-2-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
References: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.173
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/8] notifier: switch to QLIST
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jan 2012 18:01:09 -0000

Notifiers do not need to access both ends of the list, and using
a QLIST also simplifies the API.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
	I do plan to exploit the simplified API in a future patch...

 input.c      |    2 +-
 migration.c  |    2 +-
 notify.c     |   10 +++++-----
 notify.h     |    8 ++++----
 qemu-timer.c |    2 +-
 vl.c         |    2 +-
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/input.c b/input.c
index 9ade63f..b618ea4 100644
--- a/input.c
+++ b/input.c
@@ -268,5 +268,5 @@ void qemu_add_mouse_mode_change_notifier(Notifier *notify)
 
 void qemu_remove_mouse_mode_change_notifier(Notifier *notify)
 {
-    notifier_list_remove(&mouse_mode_notifiers, notify);
+    notifier_remove(notify);
 }
diff --git a/migration.c b/migration.c
index 412fdfe..0de907c 100644
--- a/migration.c
+++ b/migration.c
@@ -333,7 +333,7 @@ void add_migration_state_change_notifier(Notifier *notify)
 
 void remove_migration_state_change_notifier(Notifier *notify)
 {
-    notifier_list_remove(&migration_state_notifiers, notify);
+    notifier_remove(notify);
 }
 
 bool migration_is_active(MigrationState *s)
diff --git a/notify.c b/notify.c
index a6bac1f..ac05f91 100644
--- a/notify.c
+++ b/notify.c
@@ -16,24 +16,24 @@
 
 void notifier_list_init(NotifierList *list)
 {
-    QTAILQ_INIT(&list->notifiers);
+    QLIST_INIT(&list->notifiers);
 }
 
 void notifier_list_add(NotifierList *list, Notifier *notifier)
 {
-    QTAILQ_INSERT_HEAD(&list->notifiers, notifier, node);
+    QLIST_INSERT_HEAD(&list->notifiers, notifier, node);
 }
 
-void notifier_list_remove(NotifierList *list, Notifier *notifier)
+void notifier_remove(Notifier *notifier)
 {
-    QTAILQ_REMOVE(&list->notifiers, notifier, node);
+    QLIST_REMOVE(notifier, node);
 }
 
 void notifier_list_notify(NotifierList *list, void *data)
 {
     Notifier *notifier, *next;
 
-    QTAILQ_FOREACH_SAFE(notifier, &list->notifiers, node, next) {
+    QLIST_FOREACH_SAFE(notifier, &list->notifiers, node, next) {
         notifier->notify(notifier, data);
     }
 }
diff --git a/notify.h b/notify.h
index 54fc57c..03cf26c 100644
--- a/notify.h
+++ b/notify.h
@@ -21,22 +21,22 @@ typedef struct Notifier Notifier;
 struct Notifier
 {
     void (*notify)(Notifier *notifier, void *data);
-    QTAILQ_ENTRY(Notifier) node;
+    QLIST_ENTRY(Notifier) node;
 };
 
 typedef struct NotifierList
 {
-    QTAILQ_HEAD(, Notifier) notifiers;
+    QLIST_HEAD(, Notifier) notifiers;
 } NotifierList;
 
 #define NOTIFIER_LIST_INITIALIZER(head) \
-    { QTAILQ_HEAD_INITIALIZER((head).notifiers) }
+    { QLIST_HEAD_INITIALIZER((head).notifiers) }
 
 void notifier_list_init(NotifierList *list);
 
 void notifier_list_add(NotifierList *list, Notifier *notifier);
 
-void notifier_list_remove(NotifierList *list, Notifier *notifier);
+void notifier_remove(Notifier *notifier);
 
 void notifier_list_notify(NotifierList *list, void *data);
 
diff --git a/qemu-timer.c b/qemu-timer.c
index cd026c6..2eda9b9 100644
--- a/qemu-timer.c
+++ b/qemu-timer.c
@@ -453,7 +453,7 @@ void qemu_register_clock_reset_notifier(QEMUClock *clock, Notifier *notifier)
 
 void qemu_unregister_clock_reset_notifier(QEMUClock *clock, Notifier *notifier)
 {
-    notifier_list_remove(&clock->reset_notifiers, notifier);
+    notifier_remove(notifier);
 }
 
 void init_clocks(void)
diff --git a/vl.c b/vl.c
index d925424..a40b134 100644
--- a/vl.c
+++ b/vl.c
@@ -2058,7 +2058,7 @@ void qemu_add_exit_notifier(Notifier *notify)
 
 void qemu_remove_exit_notifier(Notifier *notify)
 {
-    notifier_list_remove(&exit_notifiers, notify);
+    notifier_remove(notify);
 }
 
 static void qemu_run_exit_notifiers(void)
-- 
1.7.7.1



