Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UNF1E-0004Vd-Qu
	for mharc-qemu-trivial@gnu.org; Wed, 03 Apr 2013 00:09:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNF1B-0004UO-8J
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 00:09:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNF1A-0007Pm-Eh
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 00:09:49 -0400
Received: from mail-pa0-f52.google.com ([209.85.220.52]:35975)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNF1A-0007Pc-8b
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 00:09:48 -0400
Received: by mail-pa0-f52.google.com with SMTP id fb10so664864pad.25
	for <qemu-trivial@nongnu.org>; Tue, 02 Apr 2013 21:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=eyuhFXdhRH/W6FmUyElu4HZE8GvDR60Dy9BF08DdQ/o=;
	b=Fve3Q/q4uHHr6AC7x1N3liJfvMpgMOCHiZQxf162R/zlG0JjdKRu1sSbEW+TDIcBoW
	tHI+Kh2QqbAN/faWwOiHDyvxcH5Hkg5bvrXLXHUlqVF+GKRkVi6IsLoxQPl2xnn3TJyf
	QphpmUYnF4J18Ax0xd9tAIZEpmL8kI6da9hkARi9RDpUOaggJMHzx6X8rziBd7Y/Hc+n
	9zRwUnQULvBht5S54IXUWIKFSiESI4Pu4NhCsiuyxIR6cUIhPKbQeQzhDuzJmejPBASP
	ZDuAxPJLQW9OwyrTX6IPEk9U2DnFk9Jb4jVFZDPFfCvO3YLaPPgotfa8pEEMVs7gbCXV
	C2rw==
X-Received: by 10.66.164.198 with SMTP id ys6mr869449pab.77.1364962187392;
	Tue, 02 Apr 2013 21:09:47 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPS id qe3sm4273730pbb.0.2013.04.02.21.09.44
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 21:09:46 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Wed,  3 Apr 2013 14:09:15 +1000
Message-Id: <cover.1364961975.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
X-Gm-Message-State: ALoCoQlZGweo/oCfU7NVqY5sj+lg5sTAsGRuQs2IMQR7sbKu7ubPzCLUPWpv2H78nFf8XJz1EBSW
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.220.52
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH v1 0/4]  m25p80: Fix debug printfery
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
X-List-Received-Date: Wed, 03 Apr 2013 04:09:51 -0000

Fix up the debug printfery m25p80 in various ways. 0 functional diff.


Peter Crosthwaite (4):
  m25p80: Fix debug messages.
  m25p80: Convert guest errors to LOG_GUEST_ERROR
  m25p80.c: Multiple debug verbosity levels
  m25p80: Add debug message for no bdrv

 hw/m25p80.c |   53 +++++++++++++++++++++++++++++------------------------
 1 files changed, 29 insertions(+), 24 deletions(-)


