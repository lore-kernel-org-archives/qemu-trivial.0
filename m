Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gznA8-0003Nb-Nu
	for mharc-qemu-trivial@gnu.org; Fri, 01 Mar 2019 13:45:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1gznA7-0003NQ-6q
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2019 13:45:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1gznA6-0004Ru-1L
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2019 13:45:35 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39598)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <tcminyard@gmail.com>)
	id 1gzn4o-0007vm-IY; Fri, 01 Mar 2019 13:40:06 -0500
Received: by mail-ot1-x341.google.com with SMTP id e15so12259040otk.6;
	Fri, 01 Mar 2019 10:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:reply-to:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jKikzR6976HVLOKPJeqSNw6NzVJu/ug+z+z09xZfPs8=;
	b=KgHDOvHDg8fszoJCw3FFz1lRBd0Ret/umJcW69Ma8haobj4q7Nv8l1+1z7ie0hU9VF
	+XPnT6CKaoHEBiJ7axt8bxO83lCBdVWT8+ZHl82YaQXdbsXf0VtMXTtpVkEnZAm7Cvw5
	Ccm4zfwQyDUQv2CS2Zb2Z1zRZeO3mAB/6xuEhcv5XEDdZ47g1mhBkUMSdeA0rqEHKMxa
	mtYLakMGOkE2IEbisD1xtVnB55GKIl+np8VtA6KKqpDLaGRSirh3VBz+jcpYkbeV27f8
	x+87TcPgbYSRKRiMc4fZaY8KKA4lB+T9mtQ2mPpyi0Z3D1WCG3rqRRHrkyPpv76hRxmq
	uopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:reply-to:references:mime-version:content-disposition:in-reply-to
	:user-agent;
	bh=jKikzR6976HVLOKPJeqSNw6NzVJu/ug+z+z09xZfPs8=;
	b=S/16QrgY0D7XVRLSNTB6+/XPd1Vi1HatfJQQuet8wLmk6ed3pHmMaHGtE9M9Zikp06
	FXIxxPfqRw2nUdlUKkfjDuX7R0WeVv08GQscpt3nnecZbKfG9KV9BdppKvn6mqE5vqpY
	EVkbE6YIW3fdjNPf1CsItOY0UYW2Chap1lpLA/EBotF9iw29IMqjY6p8cfZxfuS3bULX
	W7D2qTe9qVpiLKdrqBCPGW3HvIvOIDWyWmkPXeKIZUuhShymV/QeyV6c/J9184+g3JGD
	CLDJ2BUwDLqpF7IhE8ocq4aBzTRV/BHlYUz5wyY0h/S9dJi94GIcVWyMgX9ehrLw40eV
	xtlQ==
X-Gm-Message-State: APjAAAVdOzvmoeGr8ZDpSGolR3nr5SCCxjCuUTfH1fUE083TUfc1zA+o
	+r3DtZ5XpyrPpso+/zxeAH8mvksrfw==
X-Google-Smtp-Source: APXvYqw76pRcQ/0Qad5h2lypJIt0h+Q8wlNpXKWZ7qRseQDTrNRAJjY4Gt771WoVxBt2W9vbciZLpQ==
X-Received: by 2002:a9d:7ac9:: with SMTP id m9mr4274042otn.236.1551465590763; 
	Fri, 01 Mar 2019 10:39:50 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
	by smtp.gmail.com with ESMTPSA id
	c24sm8915147otl.67.2019.03.01.10.39.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Mar 2019 10:39:49 -0800 (PST)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown
	[IPv6:2001:470:b8f6:1b:4494:6162:4309:a9e3])
	by serve.minyard.net (Postfix) with ESMTPSA id B1EC81808F0;
	Fri,  1 Mar 2019 18:39:48 +0000 (UTC)
Date: Fri, 1 Mar 2019 12:39:45 -0600
From: Corey Minyard <minyard@acm.org>
To: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190301183945.GC19921@minyard.net>
Reply-To: minyard@acm.org
References: <1551456970-463-1-git-send-email-thuth@redhat.com>
	<74a6796e-1242-69dd-a74d-74525955f100@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74a6796e-1242-69dd-a74d-74525955f100@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: Remove (mostly)
 useless architecture checks
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
X-List-Received-Date: Fri, 01 Mar 2019 18:45:36 -0000

On Fri, Mar 01, 2019 at 12:57:19PM -0500, John Snow wrote:
> 
> 
> On 3/1/19 11:16 AM, Thomas Huth wrote:
> > These checks at the beginning of some of the tests are mostly useless:
> > We only run the tests on x86 anyway, and g_test_message() does not
> > print anything unless you call g_test_init() first.
> > 
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  tests/fdc-test.c      | 7 -------
> >  tests/ide-test.c      | 7 -------
> >  tests/ipmi-bt-test.c  | 7 -------
> >  tests/ipmi-kcs-test.c | 7 -------
> >  4 files changed, 28 deletions(-)
> > 
> > diff --git a/tests/fdc-test.c b/tests/fdc-test.c
> > index 88f1abf..31cd329 100644
> > --- a/tests/fdc-test.c
> > +++ b/tests/fdc-test.c
> > @@ -548,16 +548,9 @@ static void fuzz_registers(void)
> >  
> >  int main(int argc, char **argv)
> >  {
> > -    const char *arch = qtest_get_arch();
> >      int fd;
> >      int ret;
> >  
> > -    /* Check architecture */
> > -    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
> > -        g_test_message("Skipping test for non-x86\n");
> > -        return 0;
> > -    }
> > -
> >      /* Create a temporary raw image */
> >      fd = mkstemp(test_image);
> >      g_assert(fd >= 0);
> > diff --git a/tests/ide-test.c b/tests/ide-test.c
> > index f0280e6..300d64e 100644
> > --- a/tests/ide-test.c
> > +++ b/tests/ide-test.c
> > @@ -1009,16 +1009,9 @@ static void test_cdrom_dma(void)
> >  
> >  int main(int argc, char **argv)
> >  {
> > -    const char *arch = qtest_get_arch();
> >      int fd;
> >      int ret;
> >  
> > -    /* Check architecture */
> > -    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
> > -        g_test_message("Skipping test for non-x86\n");
> > -        return 0;
> > -    }
> > -
> >      /* Create temporary blkdebug instructions */
> >      fd = mkstemp(debug_path);
> >      g_assert(fd >= 0);
> > diff --git a/tests/ipmi-bt-test.c b/tests/ipmi-bt-test.c
> > index f4a81b5..fc4c83b 100644
> > --- a/tests/ipmi-bt-test.c
> > +++ b/tests/ipmi-bt-test.c
> > @@ -400,15 +400,8 @@ static void open_socket(void)
> >  
> >  int main(int argc, char **argv)
> >  {
> > -    const char *arch = qtest_get_arch();
> >      int ret;
> >  
> > -    /* Check architecture */
> > -    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
> > -        g_test_message("Skipping test for non-x86\n");
> > -        return 0;
> > -    }
> > -
> >      open_socket();
> >  
> >      /* Run the tests */
> > diff --git a/tests/ipmi-kcs-test.c b/tests/ipmi-kcs-test.c
> > index 178ffc1..a2354c1 100644
> > --- a/tests/ipmi-kcs-test.c
> > +++ b/tests/ipmi-kcs-test.c
> > @@ -263,16 +263,9 @@ static void test_enable_irq(void)
> >  
> >  int main(int argc, char **argv)
> >  {
> > -    const char *arch = qtest_get_arch();
> >      char *cmdline;
> >      int ret;
> >  
> > -    /* Check architecture */
> > -    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
> > -        g_test_message("Skipping test for non-x86\n");
> > -        return 0;
> > -    }
> > -
> >      /* Run the tests */
> >      g_test_init(&argc, &argv, NULL);
> >  
> > 
> 
> Hm, if you insist. I have no strong feelings... Do we plan to split
> tests out by architecture eventually? Clearly x86 only tests don't
> really need to each individually check the arch, but I'm not sure what
> the vision is.

Hmm, I don't have strong feelings, either, but I assume that you
would want to leave the door open for testing on arches besides
x86.  The IPMI device is used by at least powerpc, and probably
in some upcoming ARM64 systems.

But in that case you would want to remove these checks, anyway, and
find some other way to know if you want to run the test.  So...

Acked-by: Corey Minyard <cminyard@mvista.com>

> 
> Either way, since I have no horse in the race:
> 
> Acked-by: John Snow <jsnow@redhat.com>

