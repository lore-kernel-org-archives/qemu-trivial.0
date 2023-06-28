Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qEs3p-0006Wr-5J
	for mharc-qemu-trivial@gnu.org; Thu, 29 Jun 2023 09:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jan@jankratochvil.net>)
 id 1qErgR-0006tn-VY
 for qemu-trivial@nongnu.org; Thu, 29 Jun 2023 09:27:39 -0400
Received: from host1.jankratochvil.net ([2a02:2b88:6:3b57::1f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jan@jankratochvil.net>)
 id 1qErgP-0004Tb-Aq
 for qemu-trivial@nongnu.org; Thu, 29 Jun 2023 09:27:39 -0400
Received: from host1.jankratochvil.net (localhost [127.0.0.1])
 by host1.jankratochvil.net (8.17.1/8.17.1) with ESMTPS id 35TDRVAs1566445
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <qemu-trivial@nongnu.org>; Thu, 29 Jun 2023 15:27:32 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 host1.jankratochvil.net 35TDRVAs1566445
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jankratochvil.net;
 s=default; t=1688045252;
 bh=0+VogAgADEYf6af9wO6y/AhSllhiHKKbrQ6NSShq9Nc=;
 h=Resent-From:Resent-Date:Resent-To:Date:From:To:Subject:From;
 b=LKT1mAEqxJdUg88ahm0jJWD3iJ68j89NboPFrv/Qk90EG1xI8JCpYHH8FX1S/dO7u
 il7UWSayW7wugiv+YZ3A+ydsWIQpyNF94KqWE+K6ve3HoC1VUlMkABLeI0Wtm8CfA9
 5XFIi0NAqd1HgvMSrq/2c4EVBgoe5P67r2zBW/yg=
Received: (from lace@localhost)
 by host1.jankratochvil.net (8.17.1/8.17.1/Submit) id 35TDRVFG1566444
 for qemu-trivial@nongnu.org; Thu, 29 Jun 2023 21:27:31 +0800
Resent-From: Jan Kratochvil <jan@jankratochvil.net>
Resent-Date: Thu, 29 Jun 2023 21:27:31 +0800
Resent-Message-ID: <ZJ2Gw0SrppRHZFdi@host1.jankratochvil.net>
Resent-To: qemu-trivial@nongnu.org
Date: Wed, 28 Jun 2023 18:23:36 +0800
From: Jan Kratochvil <jan@jankratochvil.net>
To: qemu-devel@nongnu.org
Subject: [patch] trivial: man page: document display::gtk::zoom-to-fit
Message-ID: <ZJwKJ0AFTtx5tR3v@host1.jankratochvil.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=2a02:2b88:6:3b57::1f;
 envelope-from=jan@jankratochvil.net; helo=host1.jankratochvil.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 29 Jun 2023 09:51:48 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Jun 2023 13:27:40 -0000

Document display::gtk::zoom-to-fit.

info from: https://superuser.com/questions/1752209/qemu-zoom-to-fit-shortcut-or-cli-switch

Signed-off-by: Jan Kratochvil <jan@jankratochvil.net>

diff --git a/qemu-options.hx b/qemu-options.hx
index 88e93c6103..90acb31056 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2071,6 +2071,9 @@ SRST
         ``window-close=on|off`` : Allow to quit qemu with window close button
 
         ``show-menubar=on|off`` : Display the main window menubar, defaults to "on"
+
+        ``zoom-to-fit=on|off`` : Expand video output to the window size,
+                                 defaults to "off"
 
     ``curses[,charset=<encoding>]``
         Display video output via curses. For graphics device models

