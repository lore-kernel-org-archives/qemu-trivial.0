Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMBq9-0005qC-M1
	for mharc-qemu-trivial@gnu.org; Mon, 03 Aug 2015 05:15:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBps-0005NT-Ac
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpo-0003B2-UL
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:08 -0400
Received: from mail-wi0-f171.google.com ([209.85.212.171]:35816)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpo-00039J-MJ
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:04 -0400
Received: by wibxm9 with SMTP id xm9so111985863wib.0
	for <qemu-trivial@nongnu.org>; Mon, 03 Aug 2015 02:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=jiaYrZbMeMRwsjsJconVZemDLgq7bSfjUGQiia/hRug=;
	b=B7pqeYEQ4KHDM1egnyr2sCaqev+kTp20pZI7JcXBQbyQvPZCwt0Mv9LsZpzJ6Hnk4/
	ZxTKpmKfhz41iOwobFeXdM8g1cVmoAMa2JkHrAKvA9GMhe1+KzWx22o+rRHa+BBYugs9
	C/XsZ1O6A5VQvySU2ZtEi9mGGc+bGJy/ZixyM0nJcTjSe2oXF8vSn+EgLkNTTRD+tYZC
	uYp626h3/UkwExD4B0et2Am8JvaEJB7Fx8oF1glg+VgBwuiMyx/lHYywAr33hOm/2y/Z
	Xb/ra0ypz66ilbUxZUFFE37Q5XdUSsvxJCInwe+IUzDlnJhk6DG2Fn1knPQhKlyLxKnB
	0LDg==
X-Gm-Message-State: ALoCoQmxRHfxMAabKfyGmk0Udt/7xVTzWLxj5+fosBzzgHzSVcBt9BImZSu5eel4bis8faaR2ojO
X-Received: by 10.180.21.198 with SMTP id x6mr31024301wie.78.1438593304225;
	Mon, 03 Aug 2015 02:15:04 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	gm20sm10187141wjc.17.2015.08.03.02.15.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Aug 2015 02:15:02 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 321CC3E00C5;
	Mon,  3 Aug 2015 10:15:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  3 Aug 2015 10:14:40 +0100
Message-Id: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.171
Cc: qemu-trivial@nongnu.org, crosthwaitepeter@gmail.com, pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v4 00/11] qemu-log,
	perfmap and other logging tweaks
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
X-List-Received-Date: Mon, 03 Aug 2015 09:15:13 -0000

Hi,

This is mostly just a re-base to keep current with master. I've added
a couple of outstanding s-o-b and r-b tags. There are also two new
patches in this series which seemed to be worth keeping together:

 - a simple patch to dump invocation info in the log
 - the cputlb logging clean-up posted as an RFC last month

Could folks interested in TCG stuff have a look over the light
re-factor and perf map patches please?

It would be nice to get these in the next cycle but I'm unsure who's
tree I should be targeting? Most of the top level files touched
(cputlb, translate-all, qemu-log) just have the list marked as the
maintainer ;-)

Alex Bennée (9):
  tcg: add ability to dump /tmp/perf-<pid>.map files
  tcg: light re-factor and pass down TranslationBlock
  qemu-log: correct help text for -d cpu
  qemu-log: support simple pid substitution in logfile
  qemu-log: new option -dfilter to limit output
  qemu-log: dfilter-ise exec, out_asm, and op_opt
  target-arm: dfilter support for in_asm, op, opt_op
  vl.c: log system invocation when enabled
  cputlb: modernise the debug support

Peter Maydell (2):
  qemu-log: Avoid function call for disabled qemu_log_mask logging
  qemu-log: Improve the "exec" TB execution logging

 configure                  |  2 +-
 cpu-exec.c                 | 21 ++++++-----
 cputlb.c                   | 54 ++++++++++++++++++----------
 include/exec/exec-all.h    |  9 +++--
 include/qemu-common.h      |  2 ++
 include/qemu/log.h         | 28 +++++++++++++--
 qemu-log.c                 | 87 ++++++++++++++++++++++++++++++++++++++--------
 qemu-options.hx            | 25 +++++++++++++
 target-arm/translate-a64.c |  6 ++--
 target-arm/translate.c     |  6 ++--
 tcg/tcg.c                  | 28 +++++++++------
 tcg/tcg.h                  |  5 ++-
 translate-all.c            | 70 ++++++++++++++++++++++++-------------
 vl.c                       | 25 +++++++++++++
 14 files changed, 278 insertions(+), 90 deletions(-)

-- 
2.5.0


