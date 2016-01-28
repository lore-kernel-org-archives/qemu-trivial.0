Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aOnUC-0003yR-TX
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jan 2016 09:23:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aOnUA-0003u7-C8
	for qemu-trivial@nongnu.org; Thu, 28 Jan 2016 09:23:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aOnU7-0000z3-2l
	for qemu-trivial@nongnu.org; Thu, 28 Jan 2016 09:23:46 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:34646)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aOnU6-0000yl-OA
	for qemu-trivial@nongnu.org; Thu, 28 Jan 2016 09:23:42 -0500
Received: by mail-wm0-x233.google.com with SMTP id 128so12775935wmz.1
	for <qemu-trivial@nongnu.org>; Thu, 28 Jan 2016 06:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=AAQB+zYVKsPHH7VMCy/lKLWsv+Q6E+whWxfu7lTfmc0=;
	b=dxssMzM2whG7mq9XZrO3zNz1IfLUsI3pdyjZ1jxKzUY3HKdtA/OVp6NZ4vratm2H/O
	lPd2UlsJgndRHL4/4u+xTkgYco/9o9nQhMkF3H08+evObTyW3n5kxWgj67W5fpvtW1rT
	ow/NXstYx7aRsUXCm3BdKLi8y5NzO/V3vdquY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=AAQB+zYVKsPHH7VMCy/lKLWsv+Q6E+whWxfu7lTfmc0=;
	b=Ljweoje/oX01i3sh5hSfrIaI1K3FgBWKCcRyHsP1QxnjpcWSu0ur/5EWsYwfestz9q
	Xe9jxucEJBnpYf4XCAKqAmOLUdxZ9a12v7ne0+GsuX+cO6s4HcErptrXvjgh32lOe+jQ
	NrAmL9TyikbFjOTA3GzeRbl8/Pgv51Zz1uGWLOUx2p7wTRBT96RQdJK7erravGVxabWs
	rSbqjZYBKYvSLgumzcCtcdu0hkkgrTs6TDRj5F6aKZMGOoBFHH3SzutdyglitUwfzJCW
	byn0a992wynwP1cYfT8/PhitHOHIPG05uOw7D6KD6ncZb/opjHalPcIq7wv7iC8sPHBm
	tH7g==
X-Gm-Message-State: AG10YOTQ7T1cBtprtkvsJr8I0Wz6neW1nhNNZFFwXuZSsA9iIAobKqN8DYk+XAl1Oip4ieKk
X-Received: by 10.28.14.138 with SMTP id 132mr3248182wmo.25.1453991021794;
	Thu, 28 Jan 2016 06:23:41 -0800 (PST)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	k130sm3144171wmg.6.2016.01.28.06.23.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jan 2016 06:23:40 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id B3C043E0192;
	Thu, 28 Jan 2016 14:23:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 28 Jan 2016 14:23:26 +0000
Message-Id: <1453991009-32736-1-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, stefanha@redhat.com,
	pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	david@gibson.dropbear.id.au
Subject: [Qemu-trivial] [PATCH v3 0/3] Travis updates
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
X-List-Received-Date: Thu, 28 Jan 2016 14:23:47 -0000

Hi,

The first patch has been reviewed and signed off. Long term I think
it is worth applying but it look like the performance increase it
negligible compared to the old style VM builds at the moment. I
suspect this may be because the new infrastructure is under more load
as more projects have migrated.

The remaining two patches widen the testing of the code.

The first making "make check" standard for all builds unless
explicitly disabled. This reverts an original patch that moved it all
to one build while we were experiencing instability in "make check".

The second add some supplemental builds to the matrix for additional
co-routine builds. I've disabled "make check" for the gthread option
as it is current broken.

Is everyone happy for these to go in via the trivial tree?

Alex Bennée (3):
  .travis.yml: migrate to container builds
  .travis.yml: run make check for all matrix targets
  .travis.yml: enable each of the co-routine backends

 .travis.yml | 72 +++++++++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 53 insertions(+), 19 deletions(-)

-- 
2.7.0


