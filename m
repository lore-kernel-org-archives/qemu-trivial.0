Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmPL-0008Ms-61
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:05:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPI-0008I7-S9
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPH-0007dl-Jt
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:20 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:43755)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmPA-0007SJ-UI; Tue, 11 Dec 2018 13:05:13 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MDN3O-1gdtOO2kpa-00AWl9; Tue, 11 Dec 2018 19:04:26 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"fabrice.desclaux@cea.fr" <fabrice.desclaux@cea.fr>
Date: Tue, 11 Dec 2018 19:03:52 +0100
Message-Id: <20181211180352.19644-31-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:X5JEkYRwXGr65gOH6ucqeHRwgd/ThVoBoYKkqn8q1+GELbHIqWY
	muwErRQxNiPC73b9vw1ahjnhTvOLItQBZMs+3B3kXm9BkUFby4u+ayAeZxKW7cB9bmB4Lke
	V1yXqy8zWfj3wn2+sHhLFQbfXCaAWoZx8pwsw/DjCd6Mku3yvjfNO6YQBjiM/XbzNgR0oQw
	I3KMCIaVe7i8HquJC/y5A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YY21g/I6S28=:p0CJqxK6PEFIQ1LS7cLWIT
	YSX/nouScbfQqbtJm1XwP+lb8LIHITXca6RnxaF2t/rpq5XXgerHPQTpjc23xy7CmP9rV/3kT
	LQjxGK6v8ismFgD47Ke+h/7arg7IfENm/GS/g24dfpLKoZR6W76XE4+2IEcWuvupHF8zwY2EW
	3ZbJNjh/oXCzDAr091r7o+i0qOniCTmcMdqZiJLB/tbZEIJsb0H4Jc/t5nIf+AFrJFU8rfiu4
	GuLLY0IP2S5bZR6BT/Dem8F+nei0OL1WXVLLOiV+WM2K+7NPkvkD5T90VIqOwr+dORPUYaPIr
	SPN8S4G0r1rot2PwBYX31GNDONhTU7CrQw+yCuC5NN5X9Ye/7bsrHG6i/w4Ocw4WdsVvvr1yr
	Ek4X3K9Pb7luAGDSmC0drELYSZdEaz216/X8Fp+tRDt9fBLYzNjFljRex41X5A5v1gCTdpDyl
	aAkhdX1LqjYPqlnLMG4eLZVnblcdDvh+2qabhsxcRBo75M8fHnL4UcQKP4nEsG3JYEujxkRMH
	YDjxTHzOj1CuXOj126K2uPTzcXuA6QLm48ZFf+VVfTO9bGP+XmB8zfKbdqq7q3RkvC0Kmc4Dg
	3mnmQSADJud/oNn1vqJxGlksWoIXrIX3JJbdfVLlp53gnc2YbbVPTxTRQLcDBwzi1+wyLZqNL
	r6Lac+7jhCxfaOC+ijkwkounT47afUm8xll4/HCJdDwkHUNiVlyBjbsfeOB2Zx9Maj9ElTn2V
	10p9SVUj8bx/Fr4t0gCW7aylXn1dHqbPNATHkQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 30/30] Fixes i386 xchgq test
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
X-List-Received-Date: Tue, 11 Dec 2018 18:05:21 -0000

From: "fabrice.desclaux@cea.fr" <fabrice.desclaux@cea.fr>

As "xchg" reads and writes both operands, the "+m" is required to avoid
undefined behavior on -O2 compilation.

Signed-off-by: Fabrice Desclaux <fabrice.desclaux@cea.fr>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <03506cf0-a204-f619-8ee4-4990a5e69af5@cea.fr>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/tcg/i386/test-i386.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/i386/test-i386.c b/tests/tcg/i386/test-i386.c
index a29b41e764..18d5609665 100644
--- a/tests/tcg/i386/test-i386.c
+++ b/tests/tcg/i386/test-i386.c
@@ -1137,7 +1137,7 @@ void test_xchg(void)
     TEST_XCHG(xchgb, "b", "+q");
 
 #if defined(__x86_64__)
-    TEST_XCHG(xchgq, "", "=m");
+    TEST_XCHG(xchgq, "", "+m");
 #endif
     TEST_XCHG(xchgl, "k", "+m");
     TEST_XCHG(xchgw, "w", "+m");
-- 
2.19.2


