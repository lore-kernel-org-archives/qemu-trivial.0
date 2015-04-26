Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmSkt-0007YO-56
	for mharc-qemu-trivial@gnu.org; Sun, 26 Apr 2015 16:02:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmRx1-00022w-QK
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 15:10:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmRx0-0006tM-Vk
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 15:10:47 -0400
Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f]:35085)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1YmRwv-0006rA-Ki; Sun, 26 Apr 2015 15:10:41 -0400
Received: by pdbqd1 with SMTP id qd1so104895162pdb.2;
	Sun, 26 Apr 2015 12:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vLmofVuAUJSuJsYFCMh0PUH1GWeKPL9IGMPoIMcwEfw=;
	b=K3lQIYAmzVdGRd1QXGIX1BEV7MXHqv5JD2dM55XY57Ilgbw6H87Kt6nl2KKs+HoXUN
	TGCmnNVi8g2MHtt13WZWWbIooMNhz874ZYgdX81pEpGPSPQIpyNp+1ze5mPbX0C0GJBg
	022+R/y5GDROROKVBTbh7phSYoQqlgzELieaVn+B23YkbI9UVoWD0KGH1UtrOvqu9VXp
	EfhZs5nc+n/XjESq/xnU/6gvQGCb3szaMN7Zsys67lLomKSY6mBZAj5b1X1P6QzJKal/
	jvQ1y/6pKzbDoXkVZ0Gb1k+bNzL6Pb8YocX6kBmKHgEVLL6py4jg0gw1+sl4f2ZrW7ZB
	QeEw==
X-Received: by 10.68.194.6 with SMTP id hs6mr15704006pbc.58.1430075439612;
	Sun, 26 Apr 2015 12:10:39 -0700 (PDT)
Received: from pcrost-laptop.hsd1.ca.comcast.net
	(c-24-5-157-48.hsd1.ca.comcast.net. [24.5.157.48])
	by mx.google.com with ESMTPSA id
	ux4sm16997226pbc.61.2015.04.26.12.10.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Apr 2015 12:10:38 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 26 Apr 2015 12:10:18 -0700
Message-Id: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22f
X-Mailman-Approved-At: Sun, 26 Apr 2015 16:02:16 -0400
Cc: qemu-trivial@nongnu.org, edgari@xilinx.com,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PATCH microblaze v1 0/6] Microblaze Cleanups
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
X-List-Received-Date: Sun, 26 Apr 2015 19:10:48 -0000

Hi Edgar,

This is some code cleanup of Microblaze. Mainly unused code
deletion but also code share of the defconfig (P1).

Regards,
Peter

Peter Crosthwaite (6):
  defconfigs: Piggyback microblazeel on microblaze
  mb: mmu: Delete flip_um fn prototype
  mb: cpu: Remote unused cpu_get_pc
  mb: cpu: Remove unused CC_OP enum
  mb: cpu: Delete EXCP_NMI
  mb: cpu: delete unused cpu_interrupts_enabled

 default-configs/microblazeel-softmmu.mak | 10 +---------
 target-microblaze/cpu.h                  | 17 -----------------
 target-microblaze/mmu.h                  |  1 -
 3 files changed, 1 insertion(+), 27 deletions(-)

-- 
1.9.1


