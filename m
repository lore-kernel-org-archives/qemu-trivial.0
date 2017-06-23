Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dORBP-0003Ns-Jb
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jun 2017 12:11:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dORBN-0003Le-5L
	for qemu-trivial@nongnu.org; Fri, 23 Jun 2017 12:11:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dORBM-0002cu-Do
	for qemu-trivial@nongnu.org; Fri, 23 Jun 2017 12:11:41 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34774)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dORBK-0002bn-FS; Fri, 23 Jun 2017 12:11:38 -0400
Received: by mail-qt0-x244.google.com with SMTP id w6so5822472qtg.1;
	Fri, 23 Jun 2017 09:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hFf2KFsdhk8KfU8QZbv8849/lFLO3WcWHvdLj5cHgVs=;
	b=vhUVzf34lrJdkzbsLpzPOWqYb848+092wUNwW0+S8HOanEX55Fye2McLWFpLZIEvZl
	Df9FxBHW6PUlV2ibFB5qahDgkM4EOLc9OEufr0YQp0C1h/h2MTD2XCIaUiG2FHvogRvu
	GqO68yd1Nv7y1qZGIQN6zfJeHDNg1580pE7TqrkMXWNDG87afolAL1BSEXTrl/fyVw6X
	4+0JeVeuMyWSmBKUBsU7jNclwuDWWm041R4LCQpDC4AFj6HBp2NoGcDqV7t8yc8CoYBc
	8PXd/58+l0rtZofX+EOSyHMXEwy6SzLErTrfn++RzBHBKs09v6prkDIL/xcAy1gIWlR2
	1Buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=hFf2KFsdhk8KfU8QZbv8849/lFLO3WcWHvdLj5cHgVs=;
	b=C2SYLX/wkJKddPplSNEXwPZIunZfEK4luZ+Mo/RPPoS7lSzxUFOr7jLFSvirZIsaFB
	mH3Oa8+7CTVi3dZp2EBqPk36uR2mtsKGJEILByhGbB/vEhRMp19KF/P9b5SAaARRwjWd
	ijND6+p9SmZOxZgfguxO5chNmoEvADTsGYq75QoFKdnEzujKTymEL4P3w3uysK/yHMEN
	NKFh+cWnlLuy8iw5Ja8yZyUuWtUyZRoR7M7WtKT++fBNKmBMOzBaLrjp1y/4vhJFcyeZ
	5Te6jrwdJ8mBGsoOl+RWR2Wyl3PFydLAAUHksEspfa07jmipaBwSm/QrkZVBp1YNED1O
	Q2cQ==
X-Gm-Message-State: AKS2vOzWuB+cqg1ocP9C5Iiqnd5YDhehfFFhSGvqXxWxMNgAVw1bAQQW
	DOGtp/1q0lDOkB/Xngs=
X-Received: by 10.237.54.226 with SMTP id f89mr10036879qtb.132.1498234297680; 
	Fri, 23 Jun 2017 09:11:37 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id m4sm3853599qkm.9.2017.06.23.09.11.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Jun 2017 09:11:37 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 23 Jun 2017 13:11:21 -0300
Message-Id: <20170623161121.8047-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170623161121.8047-1-f4bug@amsat.org>
References: <20170623161121.8047-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v3 2/2] MAINTAINERS: add entry for
 "Unimplemented" device
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
X-List-Received-Date: Fri, 23 Jun 2017 16:11:42 -0000

Also voluntary myself as reviewer

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7b7543a54e..6febb4f9ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1160,6 +1160,13 @@ F: docs/specs/vmgenid.txt
 F: tests/vmgenid-test.c
 F: stubs/vmgenid.c
 
+Unimplemented device
+M: Peter Maydell <peter.maydell@linaro.org>
+R: Philippe Mathieu-Daudé <f4bug@amsat.org>
+S: Maintained
+F: include/hw/misc/unimp.h
+F: hw/misc/unimp.c
+
 Subsystems
 ----------
 Audio
-- 
2.13.1


