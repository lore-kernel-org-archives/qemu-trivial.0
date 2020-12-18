Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kqH7o-0004rs-EP
	for mharc-qemu-trivial@gnu.org; Fri, 18 Dec 2020 09:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ptr@void-ptr.info>) id 1kqBp0-0003vc-Lw
 for qemu-trivial@nongnu.org; Fri, 18 Dec 2020 04:13:10 -0500
Received: from [185.44.68.223] (port=59864 helo=void-ptr.info)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ptr@void-ptr.info>) id 1kqBoz-0007W8-54
 for qemu-trivial@nongnu.org; Fri, 18 Dec 2020 04:13:10 -0500
Received: from ptr by void-ptr.info with local (Exim 4.94-23-08f2e6366)
 (envelope-from <ptr@void-ptr.info>)
 id 1kqBXc-0003x1-90; Fri, 18 Dec 2020 11:55:12 +0300
From: Petr Ovtchenkov <ptr@void-ptr.info>
To: qemu-trivial@nongnu.org
Cc: Petr Ovtchenkov <ptr@void-ptr.info>
Subject: [PATCH 0/1] deprecated ASN1 macros from libtasn1.h
Date: Fri, 18 Dec 2020 11:55:04 +0300
Message-Id: <20201218085505.15134-1-ptr@void-ptr.info>
X-Mailer: git-send-email 2.29.2.1.g08c1adf7b9
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.44.68.223 (failed)
Received-SPF: none client-ip=185.44.68.223; envelope-from=ptr@void-ptr.info;
 helo=void-ptr.info
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_40=-0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 18 Dec 2020 09:52:55 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Dec 2020 09:13:10 -0000

Some macros in libtasn1.h are deprecated and produce warning that brake
compilation (with -Werror).

See fae39782 in libtasn1:

  Author: Tim Rühsen <tim.ruehsen@gmx.de>
  Date:   Thu Mar 12 15:16:40 2020 +0100

      Print deprecation warning for deprecated macros

      Use _Pragma to print warning for using deprecated macros.
      This is enabled for gcc >= 3.1.

      Signed-off-by: Tim Rühsen <tim.ruehsen@gmx.de>


Petr Ovtchenkov (1):
  replace ASN1 deprecated macros

 tests/crypto-tls-x509-helpers.c | 10 +++++-----
 tests/crypto-tls-x509-helpers.h |  2 +-
 tests/pkix_asn1_tab.c           |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.29.2.1.g08c1adf7b9


