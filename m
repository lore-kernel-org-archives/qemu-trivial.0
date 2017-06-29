Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQaym-0001U7-NN
	for mharc-qemu-trivial@gnu.org; Thu, 29 Jun 2017 11:03:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQayk-0001Rg-2t
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 11:03:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQayj-0006h6-BW
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 11:03:34 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35349)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQayb-0006eL-9L; Thu, 29 Jun 2017 11:03:25 -0400
Received: by mail-qk0-x241.google.com with SMTP id 16so11947628qkg.2;
	Thu, 29 Jun 2017 08:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=niq5+p3ciEgYdbqs6UgOuDdCBEvOHE8L9JO17e9ZpXE=;
	b=PqdV2iGmHUQzpOkJqtOWee1QaAeKNcF2T1HMwGL6VwwOAwXW/aHgJ6lASXUH5qBso8
	ZJmISxGY2cTX2xstxkDadmXF9rHqFCjFVKO1k2LAC/JRCmGcOY33FU72vxn7TnaiivXs
	PUYViApZ5BId/TmiCfD6VzjivunMA+QFa2McHv3JZpx8UoMpllaXIunqgxRU9ZCzPngt
	tazNCUVWLc3Su5aVxET/SAEPLjMckvnKHy3EZ4Q8MhTr9m/WZ76vZMSbYBFycVAciqoZ
	pi7w6WCyEhgzB6d9O8cqMOfGz7vJTT1FFWUlHwWYDPJ+0G2WBhizqu8gM7cMeZ25gO+q
	OX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=niq5+p3ciEgYdbqs6UgOuDdCBEvOHE8L9JO17e9ZpXE=;
	b=mekTVoXXSP3AsON0H9X5PkfNz7gPNwPMGM9VCDy/tQM1YFvUA0lCUjfsJnPbo83735
	f+09saE+eqTEAz3rRuy59JMbf52Xdb69NDkRXd0Aq0EHR3y3cjIcZ+ONgg9iMnn4sTw6
	bRwmG3XqkHxjPz7pOBzt0bZPJA4w6U1oORqpm/fNZI/yhvB3KmzPVrbXIjV7gEH1LoL2
	6dUp8Avk4HHE/jMN3g6tokWK0hcQAfPVXYDjgjm+TpVcunvyF1U6gZ7SNp+KAaxSCpAG
	kT7RwaHQ1elJiiE1wMDmqJJiQYyrj645j2q1tz+Fq7Yh4b91KmIkBbbwmoOxqppnTJ/n
	6pXg==
X-Gm-Message-State: AKS2vOxSVPFLkzI0mhUT/QjI17vYpqwws2TnbB1QDtc2e2sgG9Jd7hOP
	OMiUjvSiSz7nbRbAKe3Xng==
X-Received: by 10.55.150.193 with SMTP id y184mr16354849qkd.113.1498748604520; 
	Thu, 29 Jun 2017 08:03:24 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id z1sm3873349qkb.37.2017.06.29.08.03.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jun 2017 08:03:23 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>, Stefan Weil <sw@weilnetz.de>,
	Yang Zhong <yang.zhong@intel.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org
Date: Thu, 29 Jun 2017 12:03:05 -0300
Message-Id: <20170629150308.22766-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170629150308.22766-1-f4bug@amsat.org>
References: <20170629150308.22766-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v2 2/5] MAINTAINERS: update KVM entries
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
X-List-Received-Date: Thu, 29 Jun 2017 15:03:35 -0000

moved in 92229a57 to accel/

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06006fc7df..86a08c5aac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -273,8 +273,8 @@ Overall
 M: Paolo Bonzini <pbonzini@redhat.com>
 L: kvm@vger.kernel.org
 S: Supported
-F: kvm-*
 F: */kvm.*
+F: accel/kvm/
 F: include/sysemu/kvm*.h
 
 ARM
-- 
2.13.1


