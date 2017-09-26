Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwpWC-0002fV-Vt
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 09:03:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carenas@gmail.com>) id 1dwhGf-0000R5-Dr
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 00:14:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carenas@gmail.com>) id 1dwhGe-0006BW-OT
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 00:14:45 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:36763)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <carenas@gmail.com>)
	id 1dwhGa-00066L-8i; Tue, 26 Sep 2017 00:14:40 -0400
Received: by mail-pf0-x244.google.com with SMTP id f84so4513340pfj.3;
	Mon, 25 Sep 2017 21:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6WPuAec3swa+S6XLzVYPzNOmtfkojvEgHhEVnFubLRE=;
	b=gYygoxgo4TCn2qq99sugRpwXAZW52ApKvTTttJ6JDs/owoCfXGBmdt4lvn+rvJ1rXg
	d2wwsj5QMOb5sM+BQUwYtCX2GdVCKU8jzUj+olrXZxd2Xo1pfTH5hPYGwVNnJGShiCex
	t2pAUbm9qo4l9RrZSIps2mAKOPd2x1DwqjB0nykhLPxAnphFbDBh+0QIS1hu83hpe5PP
	R8VjYnDT5dHOKh/IYCyokJoR/eFAAUiWB9hDnUxw71KkiNW/3DxYGaCaTTIAsTgVZCem
	4amqbV4/5JFRltV1lZKpbBRcPPwDYxAhRnsr9knMs9YXTmsAjiSqYfg9rKYkG6Ffbrii
	5/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6WPuAec3swa+S6XLzVYPzNOmtfkojvEgHhEVnFubLRE=;
	b=Me0mEph6+DzFkHsVEjN+GfkUNFdt0PAx1LtrYqIPODr0CCuWIpUqq4CDI3V9p9oTFC
	FOlgjWNGijtv+v7KUQEnISo7y6xocmMDhvk25NEzq7e4kH/KBjM6YLjvSBIHUaC66+Ji
	ouweO9kXqy241/PWuZCMQZwA2JIH6YbCEr1JLTysCUnjhwc24Q8/PqsocB7+4xBOHrva
	OT6VyFxlGGks9T1PgrqkXRiUdzeCqK/40llYGdKDmyQV4J6J/ysF0wLR5V4VBMTErNJo
	2wdVQlx4Fn0oGXDNH8GdHWB5JDMJbBjhhieGwEpl5ar6dmitxp942H+tjrfPz+/N1cUJ
	O+kw==
X-Gm-Message-State: AHPjjUjd/vPHarn5hBfKOHHEPDbaSG/rRny1/ZuV6sJOU3ba6TLgmbzc
	3z0ONo9E3odyU2CtRCPbl4kL0ssqdMU=
X-Google-Smtp-Source: AOwi7QB622BxPQgTiut0qUD+gJaZnN7rn2mybR2tVm9dF82VBGjPHgZUyGoO7lFM4SEzd8YCWguBoQ==
X-Received: by 10.101.66.70 with SMTP id d6mr9627540pgq.169.1506399278788;
	Mon, 25 Sep 2017 21:14:38 -0700 (PDT)
Received: from localhost.localdomain (c-73-189-82-67.hsd1.ca.comcast.net.
	[73.189.82.67]) by smtp.gmail.com with ESMTPSA id
	c16sm13979670pfj.123.2017.09.25.21.14.37
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 25 Sep 2017 21:14:37 -0700 (PDT)
From: =?UTF-8?q?Carlo=20Marcelo=20Arenas=20Bel=C3=B3n?= <carenas@gmail.com>
To: qemu-devel@nongnu.org
Cc: riku.voipio@iki.fi, laurent@vivier.eu, qemu-trivial@nongnu.org,
	=?UTF-8?q?Carlo=20Marcelo=20Arenas=20Bel=C3=B3n?= <carenas@gmail.com>
Date: Mon, 25 Sep 2017 21:14:20 -0700
Message-Id: <20170926041420.32673-1-carenas@gmail.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
X-Mailman-Approved-At: Tue, 26 Sep 2017 09:03:18 -0400
Subject: [Qemu-trivial] [PATCH] linux-user: remove duplicate break in syscall
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Sep 2017 04:14:46 -0000

likely introduced in 3532fa7402cda16f7b95261b0339c58630051f0b

Signed-off-by: Carlo Marcelo Arenas Belón <carenas@gmail.com>
---
 linux-user/syscall.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 9b6364a266..3ef4d1c568 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3131,7 +3131,6 @@ set_timeout:
         case TARGET_SO_RCVLOWAT:
 		optname = SO_RCVLOWAT;
 		break;
-            break;
         default:
             goto unimplemented;
         }
-- 
2.14.1


