Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Svt0g-0000AD-GS
	for mharc-qemu-trivial@gnu.org; Mon, 30 Jul 2012 12:39:58 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Svt0e-000091-FW
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2012 12:39:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Svt0a-00060F-DK
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2012 12:39:56 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:59006)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Svt0a-0005zb-86
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2012 12:39:52 -0400
Received: by pbbro12 with SMTP id ro12so9626325pbb.4
	for <qemu-trivial@nongnu.org>; Mon, 30 Jul 2012 09:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=/L6K9pqRF3YWiVIw5iZgJJM79WWZrdd5Qninlm1wBrc=;
	b=DZzQ17Gg1fxMy5L7i0+WSFkqJdW7s9yJ9qBgbduOgB7PJRjaQzvfeC3Y82NFshH8++
	PZrZcnym60XoDkF6cjmDsfn87OXqcEcuvHJxY3JO/LKcQjYBb0Q0Agl+tpIdUbt6jDS4
	ybD92y84T92M7clCXBtGk5+x3Bx8rwCz0Mymg4/+gUJV8OS04v1A2H071FJuCpBh14PS
	fg/uX3swPUMwzgVWjzFsJBzi6P0v65kItxuVWDWRUAf9OZhA1ZnPKlkFaDpGLDyn7QRN
	nO9OxvxJzW+/iVaGYoRsaCQFiL/lP0j010oYc79W1XBPWfDQ4sX1ctbf0rnbxLy4n0Ws
	/cvw==
MIME-Version: 1.0
Received: by 10.68.222.40 with SMTP id qj8mr36198093pbc.139.1343666390610;
	Mon, 30 Jul 2012 09:39:50 -0700 (PDT)
Received: by 10.66.218.170 with HTTP; Mon, 30 Jul 2012 09:39:50 -0700 (PDT)
In-Reply-To: <1343214711-24336-1-git-send-email-riegamaths@gmail.com>
References: <1343214711-24336-1-git-send-email-riegamaths@gmail.com>
Date: Mon, 30 Jul 2012 17:39:50 +0100
Message-ID: <CAFEAcA9xH93Q0Bh09s1QMXkLExg8_GYGdYef6itR6gY6EHP+XQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: riegamaths@gmail.com
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQlQNnPW0I00iEaHUDXzvT8MUYAteDkBFYURKwablIQU18cS0q7SLHy0FA8IsXIQ8SvK167a
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: Anthony Liguori <aliguori@us.ibm.com>,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>,
	qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <andreas.faerber@web.de>,
	Avi Kivity <avi@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] vl.c: Fix max_cpus
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
X-List-Received-Date: Mon, 30 Jul 2012 16:39:57 -0000

On 25 July 2012 12:11,  <riegamaths@gmail.com> wrote:
> From: Dunrong Huang <riegamaths@gmail.com>
>
> The VCPU count limit in kernel now is 254, defined by KVM_MAX_VCPUS
> in kernel's header files. But the count limit in QEMU is 255,
> so QEMU will failed to start if user passes "-enable-kvm" and "-smp 255"
> to it.
>
> Exit QEMU with an error if KVM is enabled and number of SMP cpus requested
> exceeds KVM_MAX_VCPUS.

I think this is the wrong approach:
 * KVM_MAX_VCPUS isn't a constant that the kernel exposes to userspace
 * it is different on different host architectures (254 happens to
   be the x86 value at the moment)
 * on PPC it is set to NR_CPUS so the maximum value will depend on
   the host system
 * it might change in the future, perhaps

If we want to identify the maximum possible number of CPUs under
KVM in advance of trying to create them all, the kernel documentation
specifies how to do this properly:

# The maximum possible value for max_vcpus can be retrieved using the
# KVM_CAP_MAX_VCPUS of the KVM_CHECK_EXTENSION ioctl() at run-time.
# If the KVM_CAP_NR_VCPUS does not exist, you should assume that
# max_vcpus is 4 cpus max.
# If the KVM_CAP_MAX_VCPUS does not exist, you should assume that
# max_vcpus is the same as the value returned from KVM_CAP_NR_VCPUS.

You could just implement this check in kvm-all.c:kvm_init(), in fact,
since smp_cpus has been set up by that point. Then you can print a
useful message and we'll fail nicely.

-- PMM

