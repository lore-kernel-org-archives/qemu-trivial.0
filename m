Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQayb-0001Kl-Ol
	for mharc-qemu-trivial@gnu.org; Thu, 29 Jun 2017 11:03:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQayZ-0001JP-Qi
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 11:03:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQayZ-0006cr-1N
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 11:03:23 -0400
Received: from mail-qk0-x232.google.com ([2607:f8b0:400d:c09::232]:33145)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQayU-0006aH-AL; Thu, 29 Jun 2017 11:03:18 -0400
Received: by mail-qk0-x232.google.com with SMTP id r62so78535751qkf.0;
	Thu, 29 Jun 2017 08:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bqauE4q5iMYLpbs4nTHf4T+9fEhm9UIZnvge2PvvYi4=;
	b=ieiB2QPaK9OqnJ+SEiTForynObhT2FLmPfMLFzSlT3DDCJOqxg59u3vZ4Sy9ssJ8jh
	3jY2wX4XP9t+yRE05l7Bl2S/X3gCaN/cNkHvIK1FQXSVrK+nppEMbD1DdqAJSP7ubCcZ
	olfpYDBsmLDJWPfOc4vHGoKQ/qwWVMR/BLNItUHwj9glYtaCJCVr3xUqokhLWLXvlRxJ
	U73eA1U19fjFnzvrhx0XKo9HneEaK3zn792NTt3pMaefTDMiUpkWl+tDOiRlrVlt3AG+
	cAmjzV/b00tssn8KyM+rMF1IGU8o4SQsXM0QnCJV8oHJIDDSyrvhehXlEmgUVML1/5JE
	rOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=bqauE4q5iMYLpbs4nTHf4T+9fEhm9UIZnvge2PvvYi4=;
	b=aacIQh4oTxIG4ZuXxPD+fUMtEcQpTMgr7RYXmNrKsUJbnWCRLS+xbK8H3DGP0qMjTI
	zsJtjITgmmPGE6OKnWHOTD72U8uBXAP4fXNnVobEx3vqSqn7GFCkkk2Uy5vNyikhgZXj
	OVXRQBD3dq8/ncM/hcOLkJRSUWVtbElGJPksmG2g6NFyzH4v8hunZS4UMMCCyeVDbqQz
	6ZCxc5tiB2U8Bm6RrI6+d/7rIdQLL7od5ZjocvtAMrI0HpT8O1zaZArETlw43IXmFLBg
	hJ58u39zNin+K260tW8pVJKwM4eMoY3xdyJvOl5rEtjaGEBBq1TLvpmBQBo1TXznUixe
	9n6Q==
X-Gm-Message-State: AKS2vOyG1zHEfUzJhR6pFnAqAY3bvCgYzvOqd5GJUrYfnCTjR7eII4fJ
	T1CkhO7hl3Zh4r9xpUP32Q==
X-Received: by 10.55.21.86 with SMTP id f83mr19004491qkh.199.1498748597321;
	Thu, 29 Jun 2017 08:03:17 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id z1sm3873349qkb.37.2017.06.29.08.03.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jun 2017 08:03:16 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org
Date: Thu, 29 Jun 2017 12:03:03 -0300
Message-Id: <20170629150308.22766-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::232
Subject: [Qemu-trivial] [PATCH v2 0/5] MAINTAINERS: update
 TCG/KVM/Xen/TCI/Unimplemented device
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
X-List-Received-Date: Thu, 29 Jun 2017 15:03:24 -0000

As requested by Thomas Huth, I separated these patches from my previous series
"removal of tci (tcg interpreter)".

TCG/KVM/Xen/TCI related files were moved in commits a9ded601..244f1441, update
MAINTAINERS to match the new paths.

Also add an entry for the "Unimplemented" device and voluntary myself as
reviewer.

Regards,

Phil.

v2:
- fix inaccurate Xen commit message (review feedback from Anthony PERARD)
- add "Unimplemented" device

v1:
- update TCG/KVM/Xen/TCI entries

Philippe Mathieu-Daudé (5):
  MAINTAINERS: update TCG entries
  MAINTAINERS: update KVM entries
  MAINTAINERS: update Xen entries
  MAINTAINERS: update TCI entry
  MAINTAINERS: add entry for "Unimplemented" device

 MAINTAINERS | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

-- 
2.13.1


