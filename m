Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fG3qf-0002fn-Sk
	for mharc-qemu-trivial@gnu.org; Tue, 08 May 2018 10:44:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fG3qd-0002b6-Oc
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 10:44:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fG3qc-0002nN-V5
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 10:44:11 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35344)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fG3qY-0002lp-2T; Tue, 08 May 2018 10:44:06 -0400
Received: by mail-qt0-x241.google.com with SMTP id f5-v6so27980535qth.2;
	Tue, 08 May 2018 07:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8FxLoG7gkkiy8//FwIZnxnNupTrmwp73CII9ieStqGY=;
	b=SbezVR8Zi+mAYNUKbKH9+rv3wBORsTG6uClbwSXsV2qFf+U8rkhgScHKu0kEollUQt
	a6cDDH9dDt+VEPsDsQEU08Us0zGn26pTECl29MGjjr20uu4BgW9s+jliljAews+1ENVi
	wdOltilDNWV86Fuvi04e4rIADfGQ8tw/lVVWKaLZvZyc2WDQ/FdHZYsYhTze+bPO5xa7
	SfaGY1WMNRZisKiCr2Zuhs+CHxFwAepxdnuGrlv8isRPSAUfmbCSDk84ca49Ce2yA1eM
	NV7gjk9B40N/zqFVMM5H+v85Sqccomvjug+ocHca7z/7K3ZNalHUdrn+7j6iGxsxds+2
	uKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=8FxLoG7gkkiy8//FwIZnxnNupTrmwp73CII9ieStqGY=;
	b=DFtOBtphsBHY8Msx9ijDhDlfxMMG9oRHd7RhV5NBJhw0vuTgah3WaT4kfkniBP+uNQ
	rxTN3zpjZ42KnafcEYeVes+zRz9K9OgJC/rdXo/gqcq1rfdnWpiI/G0WfDbm5V1oBSPs
	rTxSuzGqkvIalFc39ExB5969jc2pSBffx/fJZ01nUZI2zEnoznXM3LFrPtsGGjf9nFYH
	shvDTJRosVkFOLvmR6lhE8bt1cgn81htfbNIcgA1L4QSuPlCRNZpOhdaVeBakhWct0iJ
	1uZSnUmTPQOM0B3/rVqz5++1FSzqb0OnzPPhblMO7CnfhMuDVd2uoMC691VgbUXlEKSF
	ooeQ==
X-Gm-Message-State: ALQs6tDuOoQFXTUgP/5S9ZA0tGNCsV9REXYt+7NbZlmcasc0RVMiiJpM
	T7h8coKJzfb3ajNzrCmUff8=
X-Google-Smtp-Source: AB8JxZqj1/4gljxdHDOKEvvMmx4KGN/1zvCo+gNeKTB2ezNVIxQCPSAQcmjr3rRR0MdrDZLB6YDylA==
X-Received: by 2002:aed:23f5:: with SMTP id
	k50-v6mr37629743qtc.367.1525790645535; 
	Tue, 08 May 2018 07:44:05 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	l17sm19320483qkj.47.2018.05.08.07.44.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 May 2018 07:44:05 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-trivial@nongnu.org (open list:Trivial patches)
Date: Tue,  8 May 2018 11:43:58 -0300
Message-Id: <20180508144358.13530-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH] docker: Fix trivial typo
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
X-List-Received-Date: Tue, 08 May 2018 14:44:12 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index de87341528..ef1a3e62eb 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -46,7 +46,7 @@ docker-image-%: $(DOCKER_FILES_DIR)/%.docker
 
 docker-image-debian-powerpc-cross: EXTRA_FILES:=$(SRC_PATH)/tests/docker/dockerfiles/debian-apt-fake.sh
 
-# Enforce dependancies for composite images
+# Enforce dependencies for composite images
 docker-image-debian: docker-image-debian9
 docker-image-debian8-mxe: docker-image-debian8
 docker-image-debian-amd64: docker-image-debian9
-- 
2.17.0


