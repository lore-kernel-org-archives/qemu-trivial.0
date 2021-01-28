Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l5936-0000vW-15
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jan 2021 10:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
 id 1l58ZQ-0007bU-KC; Thu, 28 Jan 2021 09:46:52 -0500
Received: from unifiededge.gtri.gatech.edu ([130.207.205.170]:20950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
 id 1l58ZM-0000c3-5H; Thu, 28 Jan 2021 09:46:52 -0500
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; d=gtri.gatech.edu; s=unifiededge;
 c=simple/simple; t=1611844300; h=from:subject:to:date:message-id;
 bh=rgvmgdcyzggiCgfSXThLfGZq+ttZqivy+Z4oyt+0EFk=;
 b=rExLeuKUMJ1LJnvCombSZ1oNHXChZaV4MDSTkuxdCwRGHD9HXDqflhtg3Lo/I1Pog0P/te3FqA4
 KkUn7/2v4WzRKliLsNn68Ds1eKT+GRPBNh0zZjxqNMjgav7fXUaPwm4IutoaqrdASsu3opnr8mE3n
 Y21UeOyI90BTydWdivqleaHUWPjR45p/lm7P2LNJzE2qvXbIx4SPaj1AKmWwuQvFJpXdfPmIRUm/Y
 aHOdxyZtWVkwkp3loFZFAjfN+2qDpqOPqkknu2ZExEqz5O7GJdCWLvbcRmd73cZS9a79IHckAz48j
 rOBK6WNG27InYa7b5ZUQDXgLSzAU9iehNq8A==
Received: from tybee.core.gtri.org (10.41.1.49) by exedge07.gtri.dmz
 (10.41.104.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.721.2; Thu, 28 Jan 2021
 09:31:40 -0500
Received: from localhost.localdomain (10.41.0.30) by tybee.core.gtri.org
 (10.41.1.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2106.2; Thu, 28
 Jan 2021 09:31:40 -0500
From: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
To: <qemu-arm@nongnu.org>
CC: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-trivial@nongnu.org>, Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
Subject: [PATCH 0/1] target/arm: Fix SCR_EL3 migration issue
Date: Thu, 28 Jan 2021 09:31:01 -0500
Message-ID: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-ClientProxiedBy: hatteras.core.gtri.org (10.41.22.72) To tybee.core.gtri.org
 (10.41.1.49)
Received-SPF: pass client-ip=130.207.205.170;
 envelope-from=Michael.Nawrocki@gtri.gatech.edu;
 helo=unifiededge.gtri.gatech.edu
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 28 Jan 2021 10:17:29 -0500
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
X-List-Received-Date: Thu, 28 Jan 2021 14:46:54 -0000

The SCR_EL3 register reset value (0)  and the value produced when
writing 0 via the scr_write function (set as writefn in the register
struct) differ. This causes migration to fail.

I believe the solution is to specify a raw_writefn for that register.

Failing invocation:
$ qemu-system-arm -machine vexpress-a9 -cpu cortex-a9 -nographic
QEMU 5.2.0 monitor - type 'help' for more information
(qemu) migrate "exec:cat > img"
(qemu) q
$ qemu-system-arm -machine vexpress-a9 -cpu cortex-a9 -nographic -incoming "exec:cat img"
qemu-system-arm: error while loading state for instance 0x0 of device 'cpu'
qemu-system-arm: load of migration failed: Operation not permitted


Mike Nawrocki (1):
  target/arm: Add raw_writefn to SCR_EL3 register

 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.20.1


