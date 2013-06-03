Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjNNp-0000zu-E9
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 01:32:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38566)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjNNm-0000w8-Fd
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 01:32:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjNNl-0007fV-NN
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 01:32:38 -0400
Received: from mail-pb0-x22f.google.com ([2607:f8b0:400e:c01::22f]:35095)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjNNl-0007fI-HP
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 01:32:37 -0400
Received: by mail-pb0-f47.google.com with SMTP id rr4so5158020pbb.20
	for <qemu-trivial@nongnu.org>; Sun, 02 Jun 2013 22:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=Au1UwlCfz2OHiVCov4KE9oHC+zFuSIePVx9CDm16j20=;
	b=b0jRAlzSphwMAfNUZjA80ok/MiWkq8wU+1i51+jY0TOvqtk3DNOQnr77/LUQF34BLE
	B4SVKJbadJCy2Da6LtqHct8I6lKxRZuLAzFw/IlCCM5zIQjyS3K7ET7qxE9NZjuU7gzp
	3TJ+/MsPbzvXXdeTrvwG4NnJ9osRF118j3A5I+uBcKR9qWs822+KiiSq4PK3bhdJYwyG
	n7gOPeB0C9CTXWj+WWH/nZ8FDqq8BykB3qfW/7Yj2poNvxV3s9H1O5vkNnQu2PbAF25m
	Rh0Hh1332kgGkIeBu7Wkri0qlj7a3YGxuvm+oBcShDV2LWIGSkWrdG2IEzRCVj6D7t16
	OHSg==
X-Received: by 10.66.145.67 with SMTP id ss3mr23113260pab.18.1370237556751;
	Sun, 02 Jun 2013 22:32:36 -0700 (PDT)
Received: from localhost ([203.126.243.116]) by mx.google.com with ESMTPSA id
	eq4sm19476361pad.16.2013.06.02.22.32.30 for <multiple recipients>
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Sun, 02 Jun 2013 22:32:35 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: peter.crosthwaite@xilinx.com
To: qemu-devel@nongnu.org
Date: Mon,  3 Jun 2013 15:31:09 +1000
Message-Id: <cover.1370237352.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.8.3.rc1.44.gb387c77.dirty
X-Gm-Message-State: ALoCoQmNRZVZUxjalVS+2RyGTLt257tKciYs2zWdDz6K7oj0ZWFISvtRCll3dQzqBEpOlIzBxM5Z
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::22f
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, edgar.iglesias@gmail.com
Subject: [Qemu-trivial] [PATCH v1 0/3]  Memory: Trivial fixes
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
X-List-Received-Date: Mon, 03 Jun 2013 05:32:40 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Some trivial fixes to memory API.


Peter Crosthwaite (3):
  memory: Fix comment typo
  memory: as_update_topology_pass: Improve comments
  memory: render_memory_region: factor out fr constant setters

 memory.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

-- 
1.8.3.rc1.44.gb387c77.dirty


