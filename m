Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V9UtL-0005Id-OY
	for mharc-qemu-trivial@gnu.org; Wed, 14 Aug 2013 02:49:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <taimoor.mrza@gmail.com>) id 1V9LoY-0004Qd-QU
	for qemu-trivial@nongnu.org; Tue, 13 Aug 2013 17:07:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <taimoor.mrza@gmail.com>) id 1V9LoU-0007c4-79
	for qemu-trivial@nongnu.org; Tue, 13 Aug 2013 17:07:38 -0400
Received: from mail-ea0-x22b.google.com ([2a00:1450:4013:c01::22b]:39884)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <taimoor.mrza@gmail.com>)
	id 1V9LoK-0007aN-Pr; Tue, 13 Aug 2013 17:07:24 -0400
Received: by mail-ea0-f171.google.com with SMTP id n15so4373426ead.2
	for <multiple recipients>; Tue, 13 Aug 2013 14:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WGO1wccjWyYb1os5bpMMc6T002TEzG06paWFO2V9tOs=;
	b=cNg5JEg4OTp1RDm/jXVccPmMRc3Kd3nS4V6w8qSEq8BrZsOpDqOjGrqSq0ZEzeWNN7
	gKx3y7v9SoQk247xuYmcIwoJ5zCJY2FbX7Ay3JKEVaah7ZycUIiAbhaTA4uG5sJjRoEA
	A5t4IsV3IKEXH6vfg4ljVvSsPHYQcIMrQzNNkYyGUShcxEfl5Xb6yZBXg6QZJTzaMFWU
	BR8YlQg6lgxj+HTSgqpkzoeCBJkERwKHVM6xYFQxmdQ6Y6znPz8CJIZrIUVG7b98sWkN
	GtUL107A0fRxLv0PttCcCZjSXc9wqmSA/V0Z+qArVewIKnGEenmHThCUZKXsdm98ZCE3
	ggYg==
X-Received: by 10.15.34.65 with SMTP id d41mr9146027eev.45.1376428044066;
	Tue, 13 Aug 2013 14:07:24 -0700 (PDT)
Received: from Config226VM0.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPSA id a1sm69413034eem.1.2013.08.13.14.07.22
	for <multiple recipients>
	(version=TLSv1 cipher=DES-CBC3-SHA bits=168/168);
	Tue, 13 Aug 2013 14:07:23 -0700 (PDT)
From: Taimoor <taimoor.mrza@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 14 Aug 2013 02:05:25 +0500
Message-Id: <1376427925-26767-1-git-send-email-tmirza@codesourcery.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1376424027-26208-1-git-send-email-tmirza@codesourcery.com>
References: <1376424027-26208-1-git-send-email-tmirza@codesourcery.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::22b
X-Mailman-Approved-At: Wed, 14 Aug 2013 02:49:10 -0400
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
X-List-Received-Date: Tue, 13 Aug 2013 21:07:43 -0000

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
+#ifndef _WIN32
 	    (qemu_setsockopt(s, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(int)) < 0) ||
+#endif
 	    (bind(s,(struct sockaddr *)&addr, sizeof(addr)) < 0) ||
 	    (listen(s,1) < 0)) {
 		int tmperrno = errno; /* Don't clobber the real reason we failed */
-- 
1.7.5.4


