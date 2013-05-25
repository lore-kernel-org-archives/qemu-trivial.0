Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgAd4-0000yo-At
	for mharc-qemu-trivial@gnu.org; Sat, 25 May 2013 05:19:10 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UgAcx-0000yT-Tf
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 05:19:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UgAct-0002BK-Ds
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 05:19:03 -0400
Received: from mail-pa0-f49.google.com ([209.85.220.49]:50592)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UgAct-0002BE-7j
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 05:18:59 -0400
Received: by mail-pa0-f49.google.com with SMTP id bi5so5191167pad.36
	for <qemu-trivial@nongnu.org>; Sat, 25 May 2013 02:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=vpa9PFCCBWhjuknTWcScjuKvmacA1t8sGQRYFpuuw+s=;
	b=FYhGmKvArw29CbjSZn+Rbq7UxBvAWNESJnjaIDZzIFNqK9EPcedRYId0oC2gFLLNdt
	BRXtXbS15fbHiu0scr/wlKzJDRubMf1lv5JYxPQ3L1Q44w9dMXLfbL+yt+SOtrjPMcbs
	9nOHhe351oGX+6iApOGon96/wwq3ao4+sgiwhAv8URWz1P/v9UYrW8U1ErH8yRuNL+UI
	01F0iHLs3KV4WxaWjyjX5axEsz3rBUQuslb7nvzY+BFC8Yz+jkvghEW//g/ypQwF3AzO
	EL18sIh2kPk/4KyefCG5oWiGdfoT5y2Y/0pOrk5Z3/JqOhZ7/7+fcHP8AfQlmnL/vJm7
	QlWw==
X-Received: by 10.66.27.147 with SMTP id t19mr14558651pag.207.1369473538470;
	Sat, 25 May 2013 02:18:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.70.118.66 with HTTP; Sat, 25 May 2013 02:18:37 -0700 (PDT)
In-Reply-To: <519FDDBD.7030201@redhat.com>
References: <1369066884-431-1-git-send-email-peter.maydell@linaro.org>
	<519A50EE.8040804@redhat.com> <871u8zp34w.fsf@codemonkey.ws>
	<CAFEAcA90AJyBNtNxRa45y3zfWCj8tAq5jsqoDLmDTAZT0DK=2g@mail.gmail.com>
	<87y5b7hyuo.fsf@codemonkey.ws> <519FDDBD.7030201@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 May 2013 10:18:37 +0100
Message-ID: <CAFEAcA-pQXbnwUy_=HOA3JLriT4uz7vP-srNUKeXB6bYBxCj0w@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkW9IpAPonFyRUquZAKoGeljfweoJL6JdMJYz3+KNeIvkpHpk3Or8XnZuBMsYt0wUOWiyX9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.49
Cc: Anthony Liguori <aliguori@us.ibm.com>, patches@linaro.org,
	qemu-trivial@nongnu.org, John Rigby <john.rigby@linaro.org>,
	qemu-devel@nongnu.org, Libvirt <libvir-list@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [libvirt] [Qemu-devel] [PATCH] qapi-schema.json:
 Reformat TargetType enum to one-per-line
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
X-List-Received-Date: Sat, 25 May 2013 09:19:08 -0000

On 24 May 2013 22:38, Eric Blake <eblake@redhat.com> wrote:
> I think knowing the architecture (such as x86 vs. pseries ppc) is used
> by libvirt to know what default devices the board supports (for example,
> whether usb is present by default).

...but this is a per-board question, since (for instance) some
ARM boards have USB and some do not, some have PCI and some
do not, and so on.

> There's probably still room for
> improvement for communication between libvirt and qemu on what exactly
> is being supported, and knowing an architecture type may be too broad of
> a knob compared to what is really wanted, except that I don't have a
> good handle on what is really wanted.

It does sound like we could use a more specific enquiry mechanism.

-- PMM

