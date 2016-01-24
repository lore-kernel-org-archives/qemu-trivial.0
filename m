Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aNba4-0002wE-Ai
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jan 2016 02:28:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aNLNN-0006Zg-9E
	for qemu-trivial@nongnu.org; Sun, 24 Jan 2016 09:10:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aNLNM-00031Q-FC
	for qemu-trivial@nongnu.org; Sun, 24 Jan 2016 09:10:45 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:36428)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aNLNM-00030v-7w
	for qemu-trivial@nongnu.org; Sun, 24 Jan 2016 09:10:44 -0500
Received: by mail-pf0-x244.google.com with SMTP id n128so5612921pfn.3
	for <qemu-trivial@nongnu.org>; Sun, 24 Jan 2016 06:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EUAaULqcUEaxUf08kQvhUU5pi+9cZRrD2DDXAUHjt9U=;
	b=h8YIjyMhksRav/UrswZTHan+XHfQu4bc5owtJONYkhPusgnZXaZONPtMYs4AYLGXqY
	nol3odNEOV7wKnPS+OG040zsXLfDlb7+EJyLThD+IZmafHepXKFS0lsTKQ/C54TjU54O
	DXUD1Y89RiAaUg/oStuttV9BPBTBrzFTr2LIUHVBTV8m4z91Q/vmL/anqkELnbYLL5ez
	XA6J4PpjAQQ+Xdfyl90912NwKLdtUOAXGQ6iz/bcBK3gS0lh//TppPZmjNuQhQZuJQsN
	1Q3o80z1yA11G4sEMrPfx/HK+T7DxG6J0Mn0fhHHZ9csimI2sl7r5SyS1bjOzs4BFa+0
	jizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EUAaULqcUEaxUf08kQvhUU5pi+9cZRrD2DDXAUHjt9U=;
	b=V4nPmPhDHvD6jbdaMk3KrBdPVXsGwcSfGSlnaJB4wE8JCQLcWdJDpAVt+gsg/add32
	TA0VASlNi40BHptBnWgZFHjgmH5u3dkL4mCSix/OiDyJH+jkXYpQ64qi7zw6ycl2YTjX
	P94LcuXZeS+QsAZzv8fgasYMY1C3Rn99EMugmgu5E/jsMdQeAxBZGzUmajytNHJ3Zh04
	4jOgFmIcE3wRqcj6IgHRLQlmJrTfxOWkAwYWF8jzsCKoF+3K6BoXwZEtBn/rVKwZLWaB
	ctrnHCAtj/SgqZSAR6UaAB6Lb0IMjg+8O0DvDJXEUX6rtIP09XK9SNRH2GL+rgKNgmcd
	e5vg==
X-Gm-Message-State: AG10YOQFyAMdjZWrWI03R1n1fDMl/cwje+wprcyKTreYY+UmR9/yt9UMtU3f9DnOMUNXXw==
X-Received: by 10.98.71.3 with SMTP id u3mr18783398pfa.111.1453644643450;
	Sun, 24 Jan 2016 06:10:43 -0800 (PST)
Received: from localhost ([45.32.44.20]) by smtp.gmail.com with ESMTPSA id
	r26sm22106524pfb.21.2016.01.24.06.10.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jan 2016 06:10:42 -0800 (PST)
From: Wei Yang <richard.weiyang@gmail.com>
To: qemu-trivial@nongnu.org
Date: Sun, 24 Jan 2016 14:09:58 +0000
Message-Id: <1453644598-11250-2-git-send-email-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1453644598-11250-1-git-send-email-richard.weiyang@gmail.com>
References: <1453644598-11250-1-git-send-email-richard.weiyang@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
X-Mailman-Approved-At: Mon, 25 Jan 2016 02:28:54 -0500
Cc: amit.shah@redhat.com, Wei Yang <richard.weiyang@gmail.com>,
	quintela@redhat.com
Subject: [Qemu-trivial] [PATCH 2/2] qmp-spec: fix index in doc
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
X-List-Received-Date: Sun, 24 Jan 2016 14:10:46 -0000

The index is duplicated. Just change it.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
---
 docs/qmp-spec.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/qmp-spec.txt b/docs/qmp-spec.txt
index 4fb10a5..8e4bc3d 100644
--- a/docs/qmp-spec.txt
+++ b/docs/qmp-spec.txt
@@ -180,7 +180,7 @@ Some events are rate-limited to at most one per second.  If additional
 dropped, and the last one is delayed.  "Similar" normally means same
 event type.  See qmp-events.txt for details.
 
-2.5 QGA Synchronization
+2.6 QGA Synchronization
 -----------------------
 
 When using QGA, an additional synchronization feature is built into
-- 
2.5.0


