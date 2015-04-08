Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YfvcH-0005de-FO
	for mharc-qemu-trivial@gnu.org; Wed, 08 Apr 2015 15:26:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cmchao@gmail.com>) id 1YfuKv-0001WP-PB
	for qemu-trivial@nongnu.org; Wed, 08 Apr 2015 14:04:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cmchao@gmail.com>) id 1YfuKv-0001JF-2R
	for qemu-trivial@nongnu.org; Wed, 08 Apr 2015 14:04:25 -0400
Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a]:35376)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cmchao@gmail.com>)
	id 1YfuKq-0001HY-LE; Wed, 08 Apr 2015 14:04:20 -0400
Received: by pddn5 with SMTP id n5so123209572pdd.2;
	Wed, 08 Apr 2015 11:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9w+7sh03ISz89uE8dq5zibhxat7to4uwjgTrWs9RXX8=;
	b=oZh7EEQmyp7vHbBI68FeogxoCseqT/+7vCIw1+ZGmR5uRmcKN3udzZKiqcTcJMcG93
	CiYnif09aX+FurlYzKZdL896msr8kWogU+JB5lVBNDWsGrdoCMnUZ+4NyxNVHJsjaysc
	4wfM8llKoRGW+t08GKYOxiad9kEHavnVEoASqp55zimlVuXWQQ5LBwbdwRyyDb0VPMAJ
	NM5/MIo/4S4Kk4YfPGrgu869zlzalLGMGBWcYIwfdhMpqT0ySAV7mvg11L9CFhNaOLZk
	rxG0AM2hMwRedxLKPu05eeGiyviXC5O+m6F6v/dtKcPhDjhB+abJI1jWUUtsrwV8ubQv
	4tDQ==
X-Received: by 10.66.232.8 with SMTP id tk8mr47968247pac.5.1428516259034;
	Wed, 08 Apr 2015 11:04:19 -0700 (PDT)
Received: from localhost.localdomain (118-167-152-188.dynamic.hinet.net.
	[118.167.152.188])
	by mx.google.com with ESMTPSA id w1sm11968593pdp.25.2015.04.08.11.04.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Apr 2015 11:04:18 -0700 (PDT)
From: Chih-Min Chao <cmchao@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  9 Apr 2015 02:04:09 +0800
Message-Id: <1428516254-23054-1-git-send-email-cmchao@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22a
X-Mailman-Approved-At: Wed, 08 Apr 2015 15:26:23 -0400
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH 0/5] fix coding style and use of typedef type
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
X-List-Received-Date: Wed, 08 Apr 2015 18:04:27 -0000

    patch 1-2 
        fix the coding style related to space indent and brance position

    patch 3-5 
        remove the 'struct' from the type which has been typedef


Chih-Min Chao (5):
  bitops : fix coding style
  ui/vnc : fix coding style
  ui/vnc : remove 'struct' of 'typedef struct'
  ui/console : remove 'struct' from 'typedef struct' type
  hw/display : remove 'struct' from 'typedef QXL struct'

 hw/display/qxl.c       |  2 +-
 include/qemu/bitops.h  | 61 +++++++++++++++++++++++++-------------------------
 ui/console.c           |  4 ++--
 ui/spice-display.c     |  8 +++----
 ui/vnc-auth-vencrypt.c |  8 ++++---
 ui/vnc-tls.c           | 10 ++++-----
 ui/vnc-ws.c            |  4 ++--
 ui/vnc.c               |  2 +-
 8 files changed, 51 insertions(+), 48 deletions(-)

-- 
1.9.1


