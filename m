Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wn7Er-00045g-T4
	for mharc-qemu-trivial@gnu.org; Wed, 21 May 2014 10:11:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <saravanakumar.punith@gmail.com>) id 1Wn3yn-0001Rh-3m
	for qemu-trivial@nongnu.org; Wed, 21 May 2014 06:42:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <saravanakumar.punith@gmail.com>) id 1Wn3ye-0001T9-1q
	for qemu-trivial@nongnu.org; Wed, 21 May 2014 06:42:37 -0400
Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f]:48580)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <saravanakumar.punith@gmail.com>)
	id 1Wn3yL-0001Oa-DY; Wed, 21 May 2014 06:42:09 -0400
Received: by mail-pa0-f47.google.com with SMTP id lf10so1287441pab.34
	for <multiple recipients>; Wed, 21 May 2014 03:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Vs7j8OtQfsJW1oeYMNL48+mEG7l0pgktOZacsFByh7c=;
	b=Dbbk8TgCjwpuR5dm18Jyvi+VDwRhbLD0e2q+TC5UQpz0ERCiANvbUn4li6hWujo9lT
	1V4n1FH0h2rAOsNtb+tXauHLWw5D1wqWvYWpr8E3UWMY1BW3cd0h99GulO9z8NWQjYUY
	c0RhX+dWGjqMpUfong41R1R3i99OVXVDrZ7aITTXgRzbMJykVsauH72lRpqvRr6wm15f
	NHjPgr/y8CnUBrHe2qZ8WiW8MhMnEw+yGkhB61bzW+l+9JF8r53fhdp8AlSWcvibm9D5
	985dtvuLWNyCMTFZsSFjgBtnFCpicDSYgBd7OsA2hH4thSD1obaGiOu2ox+MRmlFO9A9
	1EHQ==
X-Received: by 10.68.222.196 with SMTP id qo4mr57105574pbc.14.1400668928010;
	Wed, 21 May 2014 03:42:08 -0700 (PDT)
Received: from localhost.localdomain ([111.93.218.67])
	by mx.google.com with ESMTPSA id eh4sm7490139pbc.79.2014.05.21.03.42.05
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 21 May 2014 03:42:07 -0700 (PDT)
From: Saravanakumar <saravanakumar.punith@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 May 2014 16:11:40 +0530
Message-Id: <1400668900-22972-1-git-send-email-saravanakumar.punith@gmail.com>
X-Mailer: git-send-email 1.7.6.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22f
X-Mailman-Approved-At: Wed, 21 May 2014 10:11:23 -0400
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Saravanakumar <saravanakumar.punith@gmail.com>
Subject: [Qemu-trivial] [PATCH] jazz_led: Add missing break in switch case
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
X-List-Received-Date: Wed, 21 May 2014 10:42:46 -0000


Signed-off-by: Saravanakumar <saravanakumar.punith@gmail.com>
---
 hw/display/jazz_led.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/hw/display/jazz_led.c b/hw/display/jazz_led.c
index e9bb005..12b1707 100644
--- a/hw/display/jazz_led.c
+++ b/hw/display/jazz_led.c
@@ -173,6 +173,7 @@ static void jazz_led_update_display(void *opaque)
             case 16:
                 color_segment = rgb_to_pixel16(0xaa, 0xaa, 0xaa);
                 color_led = rgb_to_pixel16(0x00, 0xff, 0x00);
+                break;
             case 24:
                 color_segment = rgb_to_pixel24(0xaa, 0xaa, 0xaa);
                 color_led = rgb_to_pixel24(0x00, 0xff, 0x00);
-- 
1.7.6.5


