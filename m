Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1koqEo-0008Bb-72
	for mharc-qemu-trivial@gnu.org; Mon, 14 Dec 2020 10:58:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEe-0007wn-5n; Mon, 14 Dec 2020 10:58:04 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:36871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqES-0001QK-AR; Mon, 14 Dec 2020 10:58:03 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M593i-1knkIm2LBM-001Cx9; Mon, 14 Dec 2020 16:57:44 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 09/19] configure: Test if $make actually exists
Date: Mon, 14 Dec 2020 16:57:23 +0100
Message-Id: <20201214155733.207430-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
References: <20201214155733.207430-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JHnV3P/bmthpjWCnE+kpU7A3yNBH+T/PRHkqdYdsnGgqhgkksYP
 2czI1wOXl5VseAFpXx7dR86WT4DmruN1g3Ry+2rJswU4xhUKS234L6VjpaHfLG/5pdpEZAh
 0ZF5SrUohD+zkWJREQAkbhbWXj/+cmfPAfXCQ/dQmZEk80mRBIjw81khcZgSUhg1aWgXUIE
 pJMzzThQ/Z16Nujro/9DQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lKh6vAvFT9Y=:lc3Tb3KSlidjlIiOQGLKVZ
 UAT+ebALPX5wM7f6OEBFyXpwSQpTCARGD9V1If+n5Acp0rCjS7pd1yUmw7fRLv2TzFtHIp/Th
 tt5xX9/Jzc4Gk/j9m/lfi0kS2zXDLD6SnXCJuA99ayE/jdqC6b9Aq4FgMQLIzUOJ0p6uGu+Dj
 BbLDooHwW4YUuNpc852kbheZ1n0XywMtSrnPMqbqu+rcYa3UsrM7yXTMTshQKayPrbhh5DkHt
 fxhGA2EMxQIQz2Ql6kqpKh4OIhIv0FgbX/nBiFP0b3FIl2EcKsa83tWX8KKbfqfuqxCY47IvB
 2eP05oKwHOU08Ep9pvKuBkno1qkHB0wsxiDwtoSvXpTM3jzrlHiNUP9fdyWIcqr/uozf8uRIA
 4wt/5no1jRbiA4faXc2eFbQlx024/HQuVeOlVez8Nm21pprBgdezqpLqzeOM919cZga8sMZX8
 TpPp8Gk5Xw==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 14 Dec 2020 15:58:05 -0000

From: Roman Bolshakov <r.bolshakov@yadro.com>

configure doesn't detect if $make is installed on the build host.
This is also helpful for hosts where an alias for make is used, i.e.
configure would fail if gmake is not present on macOS.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20200825202755.50626-5-r.bolshakov@yadro.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index 3f823ed16374..c20ed86ff35b 100755
--- a/configure
+++ b/configure
@@ -1875,6 +1875,10 @@ if test -z "$python"
 then
     error_exit "Python not found. Use --python=/path/to/python"
 fi
+if ! has "$make"
+then
+    error_exit "GNU make ($make) not found"
+fi
 
 # Note that if the Python conditional here evaluates True we will exit
 # with status 1 which is a shell 'false' value.
-- 
2.29.2


