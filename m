Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SKDsi-0001Gu-UO
	for mharc-qemu-trivial@gnu.org; Tue, 17 Apr 2012 15:16:04 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SKDsd-0001Bw-A2
	for qemu-trivial@nongnu.org; Tue, 17 Apr 2012 15:16:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SKDsX-0001Nc-5k
	for qemu-trivial@nongnu.org; Tue, 17 Apr 2012 15:15:58 -0400
Received: from mail-yw0-f45.google.com ([209.85.213.45]:48652)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SKDsW-0001MW-VI
	for qemu-trivial@nongnu.org; Tue, 17 Apr 2012 15:15:53 -0400
Received: by yhoo21 with SMTP id o21so4324841yho.4
	for <qemu-trivial@nongnu.org>; Tue, 17 Apr 2012 12:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=aaYcTJZHt0Ca9X9QXuJVofhoJNXJOPASDYUVwNe3Bto=;
	b=lBZKzlnLcHEIe/eYb11k6CiWnW4xJW2sTKZSsBh6EI1FKxAbhhSe+PkIkVue4+DfwS
	oUJOIu9Mnz9+YNzZsFXb4S32rclrWFhGv8LG8S1MKWhjsUvlXTUx7UgRML8biSUdEDt+
	4ku8yvGMeALYJEFiMp9+HKe8b7M5QnJ2a4jzK6+pNLptF15lYm5ZfEQXoP7kKvOPDz8D
	uXjJEfIFPgvxYiiOY7+AM57rQ/MMxf76vIjwnk0aadXYtfoIXvOXVA7kSHLuH5mG0sZ7
	Pu2ENFd218F+4+XxJah1zwAi7h+zyrhdtBiUgIr6v0QKW4aNP/73bCmDUYF7oK8Rbf3B
	o0mg==
MIME-Version: 1.0
Received: by 10.50.207.5 with SMTP id ls5mr10774614igc.51.1334690149547; Tue,
	17 Apr 2012 12:15:49 -0700 (PDT)
Received: by 10.50.100.198 with HTTP; Tue, 17 Apr 2012 12:15:49 -0700 (PDT)
In-Reply-To: <4F8DB4DA.5090702@suse.de>
References: <1334685493-6867-1-git-send-email-sw@weilnetz.de>
	<4F8DB4DA.5090702@suse.de>
Date: Tue, 17 Apr 2012 20:15:49 +0100
Message-ID: <CAFEAcA9kxigomS5kaDrvZJ6VBdPagwEcB7pS-ZMi4W+LtzuZjQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQkXtROQsFf4eYXo1YiyldiCFE9ZaPT0+LyJynlFiFcAimjcWKzJgqcU69wwNZnzd+jMmOLA
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] arm-dis: Fix spelling in
	comments (iff -> if)
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
X-List-Received-Date: Tue, 17 Apr 2012 19:16:03 -0000

On 17 April 2012 19:22, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> Am 17.04.2012 19:58, schrieb Stefan Weil:
>> The spelling 'iff' is sometimes used for 'if and only if'.
>> Even if that meaning could be applied here, it is not used
>> consistently. It is also quite unusual to use 'if and only if'
>> in technical documentation. Therefore a simple 'if' should be
>> preferred here.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>> =C2=A0arm-dis.c | =C2=A0 22 +++++++++++-----------
>> =C2=A01 files changed, 11 insertions(+), 11 deletions(-)
>
> Aren't the *-dis.c files imported from binutils? In that case I'd
> suggest to stay in sync with how they write/wrote it.

Yes, arm-dis.c is from binutils. These comments still read 'iff'
in current binutils, as they have done since first introduced
in binutils 2.5 in 1994.

-- PMM

