Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U4uvj-0001NY-Oc
	for mharc-qemu-trivial@gnu.org; Mon, 11 Feb 2013 10:04:27 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1U4uvZ-0001Lr-Kg
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 10:04:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1U4uvY-0003kn-2X
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 10:04:17 -0500
Received: from mail-lb0-f170.google.com ([209.85.217.170]:44006)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1U4uvX-0003jy-S5
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 10:04:16 -0500
Received: by mail-lb0-f170.google.com with SMTP id ge1so4721088lbb.1
	for <qemu-trivial@nongnu.org>; Mon, 11 Feb 2013 07:04:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=RAjjdwGsbphDzCYkbvYIkAVkqhk0oVUtIwLx9FUfd7s=;
	b=gBkcj0c+fyaqkBaO5JihlQjnTCQ5UJAvr6j/WqHmjp3D3oHy0BZLXj1OT+AmcvCXNJ
	9/bzkw3Mz7DjJshmMgt0h0G4QUUSMOYE21ZDBkY+jMeIcwHOJ4cnZ6jkKCAALBYPu6zs
	HHLYC7hQfM7WiKSqQNnYKNtJmCI0YMNXi6dPsjfE5sq6BQc+BHnVNKuC8+8GyZVYISHw
	yBCHl9cDjGNFq4/CN82LTvi1o57SBvqW/cP+X91LaV39bUurT1whYmGViHnnPg9YAarr
	UvO+I3Trvt6P4d+VNO4ZfwixJQ8NxFnbsxuD1oRQwMVi5BZHmkM0XgIbYl+k6rIh2Dna
	gm8w==
X-Received: by 10.112.30.104 with SMTP id r8mr5943309lbh.82.1360595054513;
	Mon, 11 Feb 2013 07:04:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.69.234 with HTTP; Mon, 11 Feb 2013 07:03:54 -0800 (PST)
In-Reply-To: <CAJSP0QWpPAJ9kcfK9fwhDm0g1Zaf=5g7NH3jRcsaGUv3prAOCA@mail.gmail.com>
References: <1360534332-6549-1-git-send-email-hpoussin@reactos.org>
	<20130211132727.GC6491@stefanha-thinkpad.redhat.com>
	<5118F322.709@redhat.com>
	<87k3qf9cg8.fsf@blackfin.pond.sub.org> <5118FDE9.2000101@suse.de>
	<CAFEAcA8FvkzDE2uV8bkStiFHzmhq+ERfa_ogXU7-HF8Wh90dhQ@mail.gmail.com>
	<CAJSP0QWpPAJ9kcfK9fwhDm0g1Zaf=5g7NH3jRcsaGUv3prAOCA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Feb 2013 15:03:54 +0000
Message-ID: <CAFEAcA_vvPQRKyn1h-3A5DeiFhW4-t-xrT7+q9wZfusLCvBTfw@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQl50ildMebzMlgDf9q1KfSaqE9BeP3v2EArHHtZwtS6AtVmdn7F69tbhEZxSYuSfmrqNbo4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.170
Cc: Kevin Wolf <kwolf@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, Blue Swirl <blauwirbel@gmail.com>,
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ide: log error when trying
 to use ATAPI overlapping features
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
X-List-Received-Date: Mon, 11 Feb 2013 15:04:26 -0000

On 11 February 2013 14:57, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Mon, Feb 11, 2013 at 3:34 PM, Peter Maydell <peter.maydell@linaro.org>=
 wrote:
>> On 11 February 2013 14:19, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
>>> Blue already did some work to make it more usable, and I believe Peter
>>> adopted LOG_UNIMPL for ARM devices in place of hw_error()
>>
>> Yes; in particular where we have classes of error message which the
>> user may wish to enable or disable (of which "QEMU doesn't implement
>> this" and "the guest just did something that's probably a guest bug"
>> are two common ones) qemu_log_mask(LOG_*, ...) is the preferred
>> API for devices IMHO. So I think Herve's patch is entirely the
>> right thing.
>
> qemu_log_mask() can replace fprintf() but it needs to default to
> stderr and a reasonable default mask.

Feel free to send in a patch... Also, which errors did you want
to enable by default? At the moment none of the categories are
IMHO reasonable to default to enabled.

> It should be used for non-monitor command errors and warnings.
>
> Having said that, I think we should use hw_error() or fprintf() in
> this patch until qemu_log_mask() replaces them.

It will never replace them unless we start accepting patches
like this that use qemu_log_mask() in the places where it is
appropriate.

-- PMM

