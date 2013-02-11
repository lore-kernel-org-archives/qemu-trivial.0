Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U4uai-00084z-5E
	for mharc-qemu-trivial@gnu.org; Mon, 11 Feb 2013 09:42:44 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1U4uaf-0007y5-3R
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 09:42:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1U4uad-0006n7-QT
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 09:42:40 -0500
Received: from mail-la0-x235.google.com ([2a00:1450:4010:c03::235]:45813)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1U4uad-0006mo-IQ
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 09:42:39 -0500
Received: by mail-la0-f53.google.com with SMTP id fr10so5783351lab.40
	for <qemu-trivial@nongnu.org>; Mon, 11 Feb 2013 06:42:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=xkaJ23IalD9xdoNud//qK/ufZw6uX1ByfpXKcV/iGhw=;
	b=lbxD0RgErL4fDXrZduw6PQidkcGCzUTW+O22Unw7cJGmk254w8jj7Z85EWPmhQe+Ew
	dEyfI0ylUjBAdgR6wD7w6+A88xD2kSfNbSwJZhS31GHKBseJU6//t/tRddYSuK7Jfstv
	HsHnuqzK020s2SWn0nT5HatIYQ4UaXSqYHcxxt5cXX4H6cylGi3jyKMMWUAnZlMbu9j2
	wKGWE/5jSAG0tdaSW121GWZcX/g1KPCIAb8lWSpcUiUSjs8Q93UaEXASUgI3EG941nSz
	YCqthWdAeDHon5K1eucnBBc7wksCp+Fn9Vmph4S7eEWr7mEdBY6YIBDW4UID384zfRy8
	yNYA==
X-Received: by 10.112.29.225 with SMTP id n1mr5769609lbh.58.1360593282550;
	Mon, 11 Feb 2013 06:34:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.69.234 with HTTP; Mon, 11 Feb 2013 06:34:22 -0800 (PST)
In-Reply-To: <5118FDE9.2000101@suse.de>
References: <1360534332-6549-1-git-send-email-hpoussin@reactos.org>
	<20130211132727.GC6491@stefanha-thinkpad.redhat.com>
	<5118F322.709@redhat.com>
	<87k3qf9cg8.fsf@blackfin.pond.sub.org> <5118FDE9.2000101@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Feb 2013 14:34:22 +0000
Message-ID: <CAFEAcA8FvkzDE2uV8bkStiFHzmhq+ERfa_ogXU7-HF8Wh90dhQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQmIgPt8PV6PXb5JzgS2BOZpKP5T3bkZoK7hVxHTONTGaXGtVUvp1tdI9UHb6bMn7Dvs8+wE
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::235
Cc: Kevin Wolf <kwolf@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Blue Swirl <blauwirbel@gmail.com>,
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>
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
X-List-Received-Date: Mon, 11 Feb 2013 14:42:43 -0000

On 11 February 2013 14:19, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> Am 11.02.2013 15:01, schrieb Markus Armbruster:
>> Kevin Wolf <kwolf@redhat.com> writes:
>>
>>> Am 11.02.2013 14:27, schrieb Stefan Hajnoczi:
>>>> I think we need to side-track this patch email to figure out what to
>>>> use:
>>>>
>>>> fprintf(stderr) - some warnings/errors use this
>>>> error_report() - goes to the monitor, if possible, otherwise stderr
>>>
>>> These look wrong to me.
>>
>> "Wrong" is a bit strong, in particular since there's ample precedence
>> for these uses.

Certainly for fprintf() I would say "deprecated" wherever
we have a better API available.

>>>> qemu_log_*() - goes to the qemu log, seems a little TCG-centric
>>>
>>> I would suggest either this or just trace points. (And by the way, it's
>>> a pity that -d is so TCG-centric, it's been more than once the reason
>>> why I disabled KVM when debugging a guest... Having at least -d int
>>> would be so useful.)
>>
>> Tracepoints don't really fit when we want to report the guest does
>> something we don't handle.  Users deserve fair warning then, don't they?
>>
>> Could qemu_log() & friends be made fit for general use?  What's missing?
>
> Blue already did some work to make it more usable, and I believe Peter
> adopted LOG_UNIMPL for ARM devices in place of hw_error()

Yes; in particular where we have classes of error message which the
user may wish to enable or disable (of which "QEMU doesn't implement
this" and "the guest just did something that's probably a guest bug"
are two common ones) qemu_log_mask(LOG_*, ...) is the preferred
API for devices IMHO. So I think Herve's patch is entirely the
right thing.

Tracepoints are IMHO pretty useless for this kind of message
because they're a compile time setup, not runtime, and they don't
have useful message categories. We should be expanding the use
of the qemu_log() API. If we need more categories and/or more
flexibility about where the logging goes [eg an option to direct
the logs to monitor?] we can add them.

-- PMM

