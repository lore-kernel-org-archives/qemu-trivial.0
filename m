Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmY0M-0003lW-GR
	for mharc-qemu-trivial@gnu.org; Sun, 26 Apr 2015 21:38:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmY0J-0003eK-16
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 21:38:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmY0I-0000VK-1h
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 21:38:34 -0400
Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229]:35406)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1YmY0D-0000Sm-1S; Sun, 26 Apr 2015 21:38:29 -0400
Received: by pdbqd1 with SMTP id qd1so111517201pdb.2;
	Sun, 26 Apr 2015 18:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yzEzgcGhhJ2huXYl3gDQ9xqFcGNSkpSpZ2K6mVeeObg=;
	b=blSiM23XZMF8BjIGaHXvE7DyYdZb7JYGcRZgNKVukkRi16BJ0cYRmMdOG4tTdkoTix
	YnriW8HudkoWnKO2LIsOiHFN3FzXeJbk/ASduk9xKVQm8Cc0ex3Jy7CXoQKbMCeIEq4i
	0osu0kDtOVtAK/EpeiX1XGh8XuDp1VOF1PfWQf/E6DbNty/3053t0MsK+fRjPYpD2KeZ
	G5/y4lcCAlij5PkB3n/ah8hljtjefb1OC7s7xofKCDNGTip2ex9C18OTVRVQdgeNP0uR
	xKVVmnF+A3QRMdRjyHiQ88w8SdEnns1ivdOYf1o7Om7x3X3BHaPsFIzY5eQYPwFSgMCe
	ZdvQ==
X-Received: by 10.66.146.100 with SMTP id tb4mr17761930pab.104.1430098708178; 
	Sun, 26 Apr 2015 18:38:28 -0700 (PDT)
Received: from pcrost-laptop.hsd1.ca.comcast.net
	(c-24-5-157-48.hsd1.ca.comcast.net. [24.5.157.48])
	by mx.google.com with ESMTPSA id
	bx6sm14872844pdb.39.2015.04.26.18.38.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Apr 2015 18:38:27 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 26 Apr 2015 18:38:17 -0700
Message-Id: <cover.1430096379.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::229
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PATCH target-arm 0/2] Unused code cleanups
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
X-List-Received-Date: Mon, 27 Apr 2015 01:38:35 -0000

Hi Peter,

Two unused code cleanups for target-arm/cpu.h

Regards,
Peter

Peter Crosthwaite (2):
  arm: cpu.h: Remove unused typdefs
  arm: cpu.h: Delete unused cpu_pc_from_tb()

 target-arm/cpu.h | 14 --------------
 1 file changed, 14 deletions(-)

-- 
1.9.1


