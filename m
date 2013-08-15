Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VA3DJ-0005fu-7u
	for mharc-qemu-trivial@gnu.org; Thu, 15 Aug 2013 15:28:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <taimoor.mrza@gmail.com>) id 1VA3DC-0005NU-Ju
	for qemu-trivial@nongnu.org; Thu, 15 Aug 2013 15:28:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <taimoor.mrza@gmail.com>) id 1VA3D7-0007HV-VN
	for qemu-trivial@nongnu.org; Thu, 15 Aug 2013 15:27:58 -0400
Received: from mail-ee0-x22d.google.com ([2a00:1450:4013:c00::22d]:54062)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <taimoor.mrza@gmail.com>)
	id 1VA3Cy-0007Eq-Bs; Thu, 15 Aug 2013 15:27:44 -0400
Received: by mail-ee0-f45.google.com with SMTP id c50so557197eek.32
	for <multiple recipients>; Thu, 15 Aug 2013 12:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zJgrhZvuRSj7ROJWqwIri1ri6FMwOs2PUjX/hYqsmK0=;
	b=hg7CL32caSkeVEfnll0lYMiMAtQZg+G+oxViKAdaiKQlc0lxNTuGin7F83HN8utK1z
	BMMd/Vnu4fqOfMz2vLU5BFZ++NhPcEUR2gCM+xKuSwqdh3mqG7EcY1S9zd4ntczDhPwv
	PunkgP0gpHTGtbpkYhbHt5Mx/5PHC3PeNTt/Ik1DDsiLLBPMChlvCQ5LNKTB08C5BFdG
	HKakZeukM08I9JCSyAQBdiJn+/FwZ1JrUgbJCz5N0vLt5H+xMYSEqa7sqEL4wYTmhQHC
	CbVDuGpVyB9GNGWCH2ryXMFILsgQkn2voHV1dbmTSY2g5T17z5NsFRf9NR8vGHNplzCY
	J55w==
X-Received: by 10.15.64.194 with SMTP id o42mr5674719eex.62.1376594863587;
	Thu, 15 Aug 2013 12:27:43 -0700 (PDT)
Received: from Config226VM0.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPSA id p5sm1004840eeg.5.2013.08.15.12.27.41
	for <multiple recipients>
	(version=TLSv1 cipher=DES-CBC3-SHA bits=168/168);
	Thu, 15 Aug 2013 12:27:43 -0700 (PDT)
From: Taimoor <taimoor.mrza@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 16 Aug 2013 00:25:35 +0500
Message-Id: <1376594735-7433-1-git-send-email-tmirza@codesourcery.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::22d
Cc: qemu-trivial@nongnu.org, Taimoor Mirza <tmirza@codesourcery.com>
Subject: [Qemu-trivial] [PATCH v3] slirp: Port redirection option behave
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
X-List-Received-Date: Thu, 15 Aug 2013 19:28:03 -0000

From: Taimoor Mirza <tmirza@codesourcery.com>

port redirection code uses SO_REUSEADDR socket option before binding to
host port. Behavior of SO_REUSEADDR is different on Windows and Linux.
Relaunching QEMU with same host and guest port redirection values on Linux
throws error but on Windows it does not throw any error.
Problem is discussed in http://lists.gnu.org/archive/html/qemu-devel/2013-04/msg03089.html

Signed-off-by: Taimoor Mirza <tmirza@codesourcery.com>
---
Changes in v3:
- Removed extra commit

Changes in v2:
- Changed #ifdef to #ifndef as SO_REUSEADDR should not be set in case of Windows.

 slirp/socket.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/slirp/socket.c b/slirp/socket.c
index 8e8819c..25d60e7 100644
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


