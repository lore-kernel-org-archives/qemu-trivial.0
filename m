Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtBHl-0007d0-0T
	for mharc-qemu-trivial@gnu.org; Mon, 11 Feb 2019 08:06:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gtBHi-0007aW-Sn
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2019 08:06:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gtBHd-0004DO-8t
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2019 08:06:06 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40113)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1gtBHc-0003rU-VX
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2019 08:06:01 -0500
Received: by mail-wm1-x336.google.com with SMTP id q21so17152080wmc.5
	for <qemu-trivial@nongnu.org>; Mon, 11 Feb 2019 05:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GzWjQ/ZFc5riiSufmyolljmsAwA5/pdBwRd25HGBN8c=;
	b=VVTOyD3XRBv0xICob574R88ZA+QtHgLYFhkk9XmaRv+ZaOtNP1E6zx1rHDOxKgGdJf
	Lcau5kDH/g1aZ3C2xGFoI8TeIQ4GAvYYUA7FiLEfarc8RUq78l/mWLmTXO+g07RLFgkf
	bOrCfiLKknHHvyBh2JJvkuAJZ0wE8a9ei6Krr8VMtnE5zbFOhD1wSY1P0Yi8F6yJI+9c
	WR1Kg4AlJpQuu0P9qYVo6LuOityjhLTRQ8OZPC0QVatSP0S2XWeolhA/eEWJpsnyRS/Z
	N17e5UIDccRm4TiUeQ76BCg7EUw6euxEqgOiXFaRUWCzAacrJQOwGUuuAMiWEOqnEW9g
	Qc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GzWjQ/ZFc5riiSufmyolljmsAwA5/pdBwRd25HGBN8c=;
	b=V2o6lizmQNl66HBbjUKuNcNEHneAkupT2lGCGcxdGC9GluYEvGPAJlseURBa+EJJNS
	Csg729CYJ+/8i2lT5Qvbnv894vHTcTbWIw1pUKpf9vVM/Dry43NES/LfoHqumYOkxiPc
	ZKBz0ljcoE+rXfvzo1qtsBfoi5sVxceh47/TugDwMksiCPWOvO2I1l/593jz94vt8rA5
	YtlLAntGn1/A9DpjollECVY6Bp72im69wuAnVmSXhQZSDFa12ByRlAQ/lOEzcgmFUR5F
	NM97c/mkMZuxJC+kOim44HPK3GYA22q0KREHBlxaTlMteL4yA5AFjTzMDS28azmb3G/c
	BsdA==
X-Gm-Message-State: AHQUAuZM0M3pST+eZlahbpQqH72VuFws3ytyrQ3yZdsTmw8RzDDjQ7Gp
	QksmoCr3H8nhyCpxHP7EVuiRXQ==
X-Google-Smtp-Source: AHgI3IZbT7bPv+89LFLpQXlGzB6GDQzffzxJZ6oJjwjTdLpCCfpWX9Dw8GlbBOpfpzxT+QP82v05BA==
X-Received: by 2002:a1c:2c6:: with SMTP id 189mr9032125wmc.21.1549890323299;
	Mon, 11 Feb 2019 05:05:23 -0800 (PST)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id k2sm1132861wmj.45.2019.02.11.05.05.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 05:05:21 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DA2771FF91;
	Mon, 11 Feb 2019 13:05:07 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
	qemu-trivial@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Mon, 11 Feb 2019 13:05:06 +0000
Message-Id: <20190211130507.8710-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190211130507.8710-1-alex.bennee@linaro.org>
References: <20190211130507.8710-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::336
Subject: [Qemu-trivial] [PULL 17/18] docs/devel/testing: Add -a option to
 usermod command on docker setup
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
X-List-Received-Date: Mon, 11 Feb 2019 13:06:07 -0000

From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>

The option -G of usermod command will remove user from other groups
not listed, i.e.: $USER will belong only to group 'docker' after
following the documentation as is.

From usermod(8) manual page:

    If the user is currently a member of a group which is not listed,
    the user will be removed from the group. This behaviour can be
    changed via the -a option, which appends the user to the current
    supplementary group list.

This patch improves the situation by adding the -a option to the
usermod command, which will just append user to the supplementary
group list.

Cc: qemu-trivial@nongnu.org
Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Message-Id: <20190207184346.6840-1-muriloo@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 18e2c0868a..135743a2bf 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -301,7 +301,7 @@ An alternative method to set up permissions is by adding the current user to
 .. code::
 
   $ sudo groupadd docker
-  $ sudo usermod $USER -G docker
+  $ sudo usermod $USER -a -G docker
   $ sudo chown :docker /var/run/docker.sock
 
 Note that any one of above configurations makes it possible for the user to
-- 
2.20.1


