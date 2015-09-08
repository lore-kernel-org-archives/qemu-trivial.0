Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZPWz-0006Tf-F7
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 16:30:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ZZPWt-0006Jj-4N
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 16:30:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ZZPWr-0002j7-Uk
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 16:30:10 -0400
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229]:35462)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>)
	id 1ZZPWk-0002T1-M6; Tue, 08 Sep 2015 16:30:02 -0400
Received: by wicge5 with SMTP id ge5so130832354wic.0;
	Tue, 08 Sep 2015 13:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=gds/KhhyAZIvBBM2rNflhgrBUe5M7foUod38QlrvhVs=;
	b=mojz+OPpJRqD0qLBk9f62AA28xpwZj2eCCVDHFgN+2+WWeOuarP7jvuhr5pCC/0HmS
	+tzInnFIFoMSHsUaZoX+D9MIFWNrQnO6VOYM11reWyofB/ULkBBQWzNj6Ucngm47uMK8
	a70bNODePOcIGeC7mL8FSNg9S3LwQ8YYRgiBG3fL6vw4jlTsW6PUnJyBB3S38sgVawnP
	QbBqqmp8+biq+pZk32LD6wa/qT0P7IWG4vQaFjO1hcGBeM2fHaQV3B+iNra7cSEhQmvB
	A7WNiXE6yoHV8F+RU942bGtvY9Cdkq8paMfGwkRZ4DnfQZihuAemATR3VIP4AK/zCAA+
	aFFA==
X-Received: by 10.194.250.40 with SMTP id yz8mr54274776wjc.37.1441744202116;
	Tue, 08 Sep 2015 13:30:02 -0700 (PDT)
Received: from localhost (bne75-h02-31-39-163-232.dsl.sta.abo.bbox.fr.
	[31.39.163.232]) by smtp.gmail.com with ESMTPSA id
	n15sm6621874wjr.14.2015.09.08.13.30.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 13:30:01 -0700 (PDT)
Sender: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Date: Tue,  8 Sep 2015 22:29:52 +0200
Message-Id: <1441744192-6110-1-git-send-email-marcandre.lureau@redhat.com>
X-Mailer: git-send-email 2.4.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::229
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	mst@redhat.com
Subject: [Qemu-trivial] [PATCH] specs/vhost-user.txt: fix name of messages
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
X-List-Received-Date: Tue, 08 Sep 2015 20:30:15 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/specs/vhost-user.txt | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/docs/specs/vhost-user.txt b/docs/specs/vhost-user.txt
index 0322bcf..1bc6adb 100644
--- a/docs/specs/vhost-user.txt
+++ b/docs/specs/vhost-user.txt
@@ -112,19 +112,19 @@ The communication consists of master sending message requests and slave sending
 message replies. Most of the requests don't require replies. Here is a list of
 the ones that do:
 
- * VHOST_GET_FEATURES
- * VHOST_GET_PROTOCOL_FEATURES
- * VHOST_GET_VRING_BASE
+ * VHOST_USER_GET_FEATURES
+ * VHOST_USER_GET_PROTOCOL_FEATURES
+ * VHOST_USER_GET_VRING_BASE
 
 There are several messages that the master sends with file descriptors passed
 in the ancillary data:
 
- * VHOST_SET_MEM_TABLE
- * VHOST_SET_LOG_BASE (if VHOST_USER_PROTOCOL_F_LOG_SHMFD)
- * VHOST_SET_LOG_FD
- * VHOST_SET_VRING_KICK
- * VHOST_SET_VRING_CALL
- * VHOST_SET_VRING_ERR
+ * VHOST_USER_SET_MEM_TABLE
+ * VHOST_USER_SET_LOG_BASE (if VHOST_USER_PROTOCOL_F_LOG_SHMFD)
+ * VHOST_USER_SET_LOG_FD
+ * VHOST_USER_SET_VRING_KICK
+ * VHOST_USER_SET_VRING_CALL
+ * VHOST_USER_SET_VRING_ERR
 
 If Master is unable to send the full message or receives a wrong reply it will
 close the connection. An optional reconnection mechanism can be implemented.
-- 
2.4.3


