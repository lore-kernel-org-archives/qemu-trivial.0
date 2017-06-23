Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dORBP-0003Nj-DL
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jun 2017 12:11:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dORBM-0003LL-FJ
	for qemu-trivial@nongnu.org; Fri, 23 Jun 2017 12:11:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dORBL-0002cT-Kh
	for qemu-trivial@nongnu.org; Fri, 23 Jun 2017 12:11:40 -0400
Received: from mail-qk0-x22a.google.com ([2607:f8b0:400d:c09::22a]:36511)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dORBF-0002Zt-Je; Fri, 23 Jun 2017 12:11:33 -0400
Received: by mail-qk0-x22a.google.com with SMTP id p21so39215742qke.3;
	Fri, 23 Jun 2017 09:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mTZtf2fbnIQzMmd8glU+8dPNnmPi7DyMcHwIJwR0yi0=;
	b=H+8luVKs1QPygJT3hfijMac2PIBVRSo0bsxaREWpQSi62CFIiwaluEJrYWGQYOnH8A
	YiU1UNL1d9mbcpx1e6Ow8X+UEemV2hZ5RPcEESvfUhqJBfpPtk8Z26pNbBQGZ8tJg2ni
	XvV2vTSO87bv9KhYvfp79nURU80h2oJro0oVzBvL+RUt1eAa5mh7o4jVFcb+RWd55xiV
	Kx8tTQW/nX/wYd1XwkxwT8CRuhLjoqZMGxa+0Di/oqnlrbtoaQSGz+oRrSeCVUFXWEkg
	9QsWQOkNxzOJkGvWWhRE7svcyH1WWDDlAObnEemy0yrEOwJmrVTESD5aiq15emh/E73c
	yT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=mTZtf2fbnIQzMmd8glU+8dPNnmPi7DyMcHwIJwR0yi0=;
	b=b/t0eI4esjgxnCY4toxBuudMD5cZQarPm5JdcjpX/SrAtBZ6iFbEZFeBHiR7jEZjpS
	18r0r3HpYeorGYNDAYkABZFUI/zoaMVZR0pV1xnYk5fDFl6Bm6W7u4wrbBElR+YtdO+K
	O8DMvISsoMO+nOOlsr05QN+e84KC8opQSq5KZzttmo2ttvkYY7dUhJ6vUZeBaa/ra/bm
	z1/vfTb36AUKhLBCZvw276M+nQyBq3ze/At5ZIs7HRsN3qRtl6+1BoF2+6VogHO8PY2b
	DnuANZWnX2sb3te/dq/oGi/Sa2WEM2WKdpXZrCEn843FBS63SB0/TT7/7yqy2UjmtbDZ
	XHRA==
X-Gm-Message-State: AKS2vOx140mMckUPvpfwcdWiQWuQw6feoFSvdGqQ5ivNVRjDIYLEi8cL
	NQtNt2nHI9Ue5NMh5H8=
X-Received: by 10.55.23.197 with SMTP id 66mr10386640qkx.67.1498234292961;
	Fri, 23 Jun 2017 09:11:32 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id m4sm3853599qkm.9.2017.06.23.09.11.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Jun 2017 09:11:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 23 Jun 2017 13:11:19 -0300
Message-Id: <20170623161121.8047-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22a
Subject: [Qemu-trivial] [PATCH v3 0/2] hw/unimp: add MAINTAINERS entry and
 missing include
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
X-List-Received-Date: Fri, 23 Jun 2017 16:11:41 -0000

I separated these patches from the previous series "various easy cleanups".

Add an entry in MAINTAINERS for the "Unimplemented" device, voluntary myself as
reviewer, fix a missing include.

Regards,

Phil.

Philippe Mathieu-Daudé (2):
  hw/unimp: add missing include
  MAINTAINERS: add entry for "Unimplemented" device

 MAINTAINERS             | 7 +++++++
 include/hw/misc/unimp.h | 2 ++
 2 files changed, 9 insertions(+)

-- 
2.13.1


