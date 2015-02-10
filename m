Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLJUK-0005gJ-Ir
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 17:41:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YLJUF-0005Ze-Nz
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 17:40:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YLJU5-0000W5-Gz
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 17:40:55 -0500
Received: from resqmta-po-05v.sys.comcast.net ([96.114.154.164]:56832)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YLJU4-0000VH-W4
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 17:40:45 -0500
Received: from resomta-po-02v.sys.comcast.net ([96.114.154.226])
	by resqmta-po-05v.sys.comcast.net with comcast
	id qmew1p0024tLnxL01mgjGp; Tue, 10 Feb 2015 22:40:43 +0000
Received: from red.redhat.com ([24.10.254.122])
	by resomta-po-02v.sys.comcast.net with comcast
	id qmgX1p0012fD5rL01mgiZA; Tue, 10 Feb 2015 22:40:43 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 15:40:30 -0700
Message-Id: <1423608030-20368-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 2.1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1423608043;
	bh=yFtLeCdlueErHvsUDXaDdCBVHP3nNMivhSmiEKVvy5Y=;
	h=Received:Received:From:To:Subject:Date:Message-Id;
	b=MH4gMh5oK9aT67FffEFeTEuISq4It20c08fi6qFW8Izp/B5jOueaACIBOOePKQq9o
	pxPgP+vspy1WG7o3qKH4VDqSJjrxD1uKzoeTnFAJsS+pf6JRucNvIw1an3qlaQJvJP
	Tyf6WlNB5ujfkis8pz+tw4sD9ZsrmxQwU6WEriod1N0jcxOAgQ8u9K2C8RcKwGHxsj
	vfRxI/zFYx7078spCO5G9FbjwaRJFfK9Bb6zkdA8d2TOQ/AZV/0mxFFPh8Xv9Sdzn1
	BaTTNzOLAz9qX8BK5qo6psYGl6yrUb7mzYOQFJ3BYnoItDoH+S5U+ozIxrbgiMAxmR
	Yblq8zk3p2TQQ==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 96.114.154.164
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: [Qemu-trivial] [PATCH] balloon: Fix typo
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
X-List-Received-Date: Tue, 10 Feb 2015 22:41:00 -0000

Commit 422e0501 introduced a typo (unless removing an 'o' from
balloon is how you deflate it?)

Signed-off-by: Eric Blake <eblake@redhat.com>
---

I'm usually good at spotting typos when giving my R-b.  Oh well,
Dave is doing well to make sure my ego doesn't get too inflated :)

 balloon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/balloon.c b/balloon.c
index dea19a4..70c00f5 100644
--- a/balloon.c
+++ b/balloon.c
@@ -36,7 +36,7 @@ static QEMUBalloonEvent *balloon_event_fn;
 static QEMUBalloonStatus *balloon_stat_fn;
 static void *balloon_opaque;

-static bool have_ballon(Error **errp)
+static bool have_balloon(Error **errp)
 {
     if (kvm_enabled() && !kvm_has_sync_mmu()) {
         error_set(errp, ERROR_CLASS_KVM_MISSING_CAP,
@@ -81,7 +81,7 @@ BalloonInfo *qmp_query_balloon(Error **errp)
 {
     BalloonInfo *info;

-    if (!have_ballon(errp)) {
+    if (!have_balloon(errp)) {
         return NULL;
     }

@@ -92,7 +92,7 @@ BalloonInfo *qmp_query_balloon(Error **errp)

 void qmp_balloon(int64_t target, Error **errp)
 {
-    if (!have_ballon(errp)) {
+    if (!have_balloon(errp)) {
         return;
     }

-- 
2.1.0


