Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TbvLF-0003rg-L9
	for mharc-qemu-trivial@gnu.org; Fri, 23 Nov 2012 10:38:57 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TbvLE-0003rS-0X
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 10:38:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TbvLD-0003mn-3y
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 10:38:55 -0500
Received: from mail-ia0-f173.google.com ([209.85.210.173]:59623)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TbvLC-0003mb-WF
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 10:38:55 -0500
Received: by mail-ia0-f173.google.com with SMTP id w21so5049108iac.4
	for <qemu-trivial@nongnu.org>; Fri, 23 Nov 2012 07:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=gz7+eoQw34X5PN+bOcJEviqdghSlEQmdGkvjZNmFx2A=;
	b=dM4rxYuEDzKOgBX8G80/cZJ5gjtjGUEhp4ECv7Zu7+cNUB1oQIq+dRbi2DeaJmfJCR
	BbIh8eVuYFWYP2oK/klRJvKafRYC6QhquQuAOzZwz2SGEYkE4PkiI5DHlhAuweErpnhQ
	Ge/w1cUiyuwoT34iYJDX6wbytUZPYqabnjEJKnDbADctuITqsnFGrL4jA7Csp0JFbX7g
	VjH6lRCXAMYnfmhNyBt7np1qiNDUn0TLxuMm48Tb72CFGkj7SQ4IrNvKB3PaUz4drM46
	i6jom/oASPYAqkdPTBVTPcdU9aNL52sKlXOYSsmISxy3c91AhYvjlFlm7BKBHc4EQjWN
	jFQQ==
MIME-Version: 1.0
Received: by 10.50.222.166 with SMTP id qn6mr3885890igc.47.1353685134290; Fri,
	23 Nov 2012 07:38:54 -0800 (PST)
Received: by 10.50.45.103 with HTTP; Fri, 23 Nov 2012 07:38:54 -0800 (PST)
In-Reply-To: <20121123153159.GA3912@jl-vm1.vm.bytemark.co.uk>
References: <1353683570-30525-1-git-send-email-peter.maydell@linaro.org>
	<50AF931B.8080707@redhat.com>
	<CAFEAcA9AnUrbrOKrJx7pkg9j1Ex3Ou2d23ROsn82TJa4Wdrf_Q@mail.gmail.com>
	<20121123153159.GA3912@jl-vm1.vm.bytemark.co.uk>
Date: Fri, 23 Nov 2012 15:38:54 +0000
Message-ID: <CAFEAcA9Y_fBOOMDdngu=5GApfD1OBkj6=kF4JwJTkerFydNWmw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Jamie Lokier <jamie@shareable.org>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnY0Xfp+Jo+FbLLqYF3yaWxeAGISgndF7gfA7gQ7O9Ic1mXbH8ym7LX/+KDkAg0F3IC3yCD
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Yurij Popov <oss@djphoenix.ru>, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-timer: Don't use RDTSC
	on 386s and 486s
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
X-List-Received-Date: Fri, 23 Nov 2012 15:38:57 -0000

On 23 November 2012 15:31, Jamie Lokier <jamie@shareable.org> wrote:
> x86 instruction sets haven't followed a linear progression of features
> for quite a while, especially including non-Intel chips, so it stopped
> making sense for GCC to indicate the instruction set in that way.

If you're going to go down that route you need to start defining
#defines for features then, so we could say defined(__rdtsc__)
or defined(__cmov__) and so on. I don't see any of those either :-(

-- PMM

