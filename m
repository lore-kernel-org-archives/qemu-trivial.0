Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UeTDy-00007t-Ec
	for mharc-qemu-trivial@gnu.org; Mon, 20 May 2013 12:46:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UeTDv-00006k-FQ
	for qemu-trivial@nongnu.org; Mon, 20 May 2013 12:46:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UeTDu-00030G-4Z
	for qemu-trivial@nongnu.org; Mon, 20 May 2013 12:46:11 -0400
Received: from mail-lb0-f171.google.com ([209.85.217.171]:43176)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UeT6w-0000UG-Lg
	for qemu-trivial@nongnu.org; Mon, 20 May 2013 12:38:58 -0400
Received: by mail-lb0-f171.google.com with SMTP id v20so6765344lbc.16
	for <qemu-trivial@nongnu.org>; Mon, 20 May 2013 09:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=JnVoymS7a4KSr/0yzmezoWvWf/cSSQNrA3O/Es17jLg=;
	b=EHYXGLV8ODx8vLplcGgJsPp5ieswh/6/0q7govm1dvP8ZIyZnmIwnhqOr1YknnkZMQ
	8PLpmtryIF/tYnxLVr1LUlJw5aB1FksMH1ikVQhpMAVrb3IUHosvagjeopsikg2VCjnq
	PdJ7i92tIJ+GBMzxc9/UA1hoBrmZDZF0IxDhcdU+irH1O5akwOOciChHztSzh/TCbXuC
	JPFL+I3H6mAMjKYsKtifvKp3TpTtnCjeWllyKowDXaChSUVVdlYS69t73whgEvEqZb7K
	9y9SZ5NfA8OChQWX09rzNADlfKOuZshz/25ZU4qmnVbFw+zcabEVisMLOwl+jJ9/Carj
	yArg==
X-Received: by 10.112.60.233 with SMTP id k9mr383108lbr.61.1369067937490; Mon,
	20 May 2013 09:38:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.188.130 with HTTP; Mon, 20 May 2013 09:38:37 -0700 (PDT)
In-Reply-To: <519A50EE.8040804@redhat.com>
References: <1369066884-431-1-git-send-email-peter.maydell@linaro.org>
	<519A50EE.8040804@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2013 17:38:37 +0100
Message-ID: <CAFEAcA9sECvGhLgawnOcFWrgpNJqa-Vub_0BmR7vR7Vu=wkQAQ@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkpyLUKk6jJYZHlbzXE+suDofXw5eQ2rGEZyxnJHYmxtM9IElN4LIkjPFk7JG4LWypFYn5P
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.171
Cc: Anthony Liguori <aliguori@us.ibm.com>, patches@linaro.org,
	qemu-trivial@nongnu.org, John Rigby <john.rigby@linaro.org>,
	qemu-devel@nongnu.org, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH] qapi-schema.json: Reformat TargetType
	enum to one-per-line
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
X-List-Received-Date: Mon, 20 May 2013 16:46:13 -0000

On 20 May 2013 17:35, Paolo Bonzini <pbonzini@redhat.com> wrote:
> Il 20/05/2013 18:21, Peter Maydell ha scritto:
>> Reformat the qapi-schema TargetType enumeration

> I have queued a patch for 1.6 that would change this field to a free
> string.  There is no use of this enum, not even for introspection.  You
> don't need to know what targets were supported in the version that you
> compiled from.  Only one target is supported in this executable anyway.

That sounds like a better solution. Do you have a pointer to the
patch? I tried a quick list archive search but probably didn't
use the right keywords.

thanks
-- PMM

