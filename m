Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmKos-0005QI-Cl
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 05:24:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UmKoo-0005PR-L4
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 05:24:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UmKon-00045M-EO
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 05:24:46 -0400
Received: from mail-lb0-f174.google.com ([209.85.217.174]:42057)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UmKon-00045F-6d
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 05:24:45 -0400
Received: by mail-lb0-f174.google.com with SMTP id x10so5127901lbi.5
	for <qemu-trivial@nongnu.org>; Tue, 11 Jun 2013 02:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=zPBlf+JsmZ8pcIcSUvxEifK65YUWJ95LpM8qXGHwVKo=;
	b=QY+0FBS0Emi62xami8NC3fe459VwP3n3kkJXPy3ADU/wKyC1q1KqHlNruqgesqKx0H
	4kI2v+ucE1QvTJnSnciu5/W4rssPflflxpEsJelqWSeTu1oCaJN6vaE2lHVDS1M7tjxt
	hZDNR/bhM4X47a7T9DkVmnBJYwWRG12w0O9Uy6NDfLrufcKdTsAHb4UvGShkQFMrmuXv
	CTv5gWhitbF8bVS2YVAmDDWkQJnOQNVwleIKvw9GU4BnKuQX8LzzCeEoNBQCLiWAf3D1
	w7xsYtFRPylSVIor0fEvS035wpzlZV3Zn/iAfIo5ECewUsCQldbV9oYL6uX99LjLxP3H
	LN4w==
X-Received: by 10.112.189.101 with SMTP id gh5mr8298984lbc.73.1370942684137;
	Tue, 11 Jun 2013 02:24:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.138.200 with HTTP; Tue, 11 Jun 2013 02:24:24 -0700 (PDT)
In-Reply-To: <87li6ht322.fsf@gmail.com>
References: <1370897240-23490-1-git-send-email-mjt@msgid.tls.msk.ru>
	<51B63DBE.2010903@msgid.tls.msk.ru> <87li6ht322.fsf@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jun 2013 10:24:24 +0100
Message-ID: <CAFEAcA9LtaGBDQjVY-z3ETCNsewVq3tVpu=ksHn9vUC1qaPfOQ@mail.gmail.com>
To: "M. Mohan Kumar" <mohan@in.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkb2ZymTfzWUl8knc0O0IzvSfj87gcNRu8E264OLTrH+Trj/j7eLG4vCWWOXAOWrMO+ik6U
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.174
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] configure:
 explicitly disable virtfs if softmmu=no
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
X-List-Received-Date: Tue, 11 Jun 2013 09:24:48 -0000

On 11 June 2013 10:22, M. Mohan Kumar <mohan@in.ibm.com> wrote:
> I tried ./configure --disable-system --enable-virtfs and make. But didnt
> face any build failure. Could you please share your build failure
> information? virtfs-proxy-helper.1 is created inside the fsdev folder.

Michael wrote "The build fails in this case in a separate build
tree" but your configure line suggests you were building inside
the source tree.

thanks
-- PMM

