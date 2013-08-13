Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V9UtH-0005CO-GY
	for mharc-qemu-trivial@gnu.org; Wed, 14 Aug 2013 02:49:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <taimoor.mrza@gmail.com>) id 1V9Knp-0003n1-3r
	for qemu-trivial@nongnu.org; Tue, 13 Aug 2013 16:02:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <taimoor.mrza@gmail.com>) id 1V9Knk-0000SF-Gb
	for qemu-trivial@nongnu.org; Tue, 13 Aug 2013 16:02:49 -0400
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d]:51023)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <taimoor.mrza@gmail.com>)
	id 1V9Kna-0000Oq-9y; Tue, 13 Aug 2013 16:02:34 -0400
Received: by mail-wi0-f173.google.com with SMTP id en1so1112847wid.12
	for <multiple recipients>; Tue, 13 Aug 2013 13:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9Ax4Qp6DdXIF8wHJzGaaGvvyr+h0Yz+fyzBzAZY4dj4=;
	b=ejUheIL5H6Kys+9R+CfhuIgzQEck3kVeY4OhV472KOj9u8eDY9J2X1HtJ1tyC+TLYZ
	QKqXLXQcaOMgLw9oHtWDiaMxWNP3qgL0Kn5ZLjq4a17/Q4oPEaQbqbz8gDquPUIAH+BE
	TcgoYoiBHpeGVXTYACZwb2FIytZMU3w8c3U4jdmuhobBZqMmdnkA7t2YCgL6AZhwxIUh
	5XpKQDVf/D8qxPRBEkN2SYzbPvxQuioMFGfDb8TZ6uNd9w6Sbwa3cC/NpDPuBgnCUwtl
	Ietcqql9qamwVDq3VVPNzua5UENyYb6NQPsHuK7Vlec4TgtS7EJA3DujROUO8DuWMaBt
	1EJg==
X-Received: by 10.180.211.206 with SMTP id ne14mr3834256wic.30.1376424153016; 
	Tue, 13 Aug 2013 13:02:33 -0700 (PDT)
Received: from Config226VM0.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPSA id o10sm5434128wiz.5.2013.08.13.13.02.31
	for <multiple recipients>
	(version=TLSv1 cipher=DES-CBC3-SHA bits=168/168);
	Tue, 13 Aug 2013 13:02:32 -0700 (PDT)
From: Taimoor <taimoor.mrza@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 14 Aug 2013 01:00:27 +0500
Message-Id: <1376424027-26208-1-git-send-email-tmirza@codesourcery.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22d
X-Mailman-Approved-At: Wed, 14 Aug 2013 02:49:06 -0400
Cc: qemu-trivial@nongnu.org, Taimoor Mirza <tmirza@codesourcery.com>
Subject: [Qemu-trivial] [PATCH] slirp: Port redirection option behave
	differently on Linux and Windows
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
X-List-Received-Date: Tue, 13 Aug 2013 20:02:53 -0000

From: Taimoor Mirza <tmirza@codesourcery.com>

port redirection code uses SO_REUSEADDR socket option before binding to
host port. Behavior of SO_REUSEADDR is different on Windows and Linux.
Relaunching QEMU with same host and guest port redirection values on Linux
throws error but on Windows it does not throw any error.
Problem is discussed in http://lists.gnu.org/archive/html/qemu-devel/2013-04/msg03089.html

Signed-off-by: Taimoor Mirza <tmirza@codesourcery.com>
---
 slirp/socket.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/slirp/socket.c b/slirp/socket.c
index 8e8819c..23780b3 100644
--- a/slirp/socket.c
+++ b/slirp/socket.c
@@ -627,7 +627,9 @@ tcp_listen(Slirp *slirp, uint32_t haddr, u_int hport, uint32_t laddr,
 	addr.sin_port = hport;
 
 	if (((s = qemu_socket(AF_INET,SOCK_STREAM,0)) < 0) ||
+#ifdef _WIN32
 	    (qemu_setsockopt(s, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(int)) < 0) ||
+#endif
 	    (bind(s,(struct sockaddr *)&addr, sizeof(addr)) < 0) ||
 	    (listen(s,1) < 0)) {
 		int tmperrno = errno; /* Don't clobber the real reason we failed */
-- 
1.7.5.4


