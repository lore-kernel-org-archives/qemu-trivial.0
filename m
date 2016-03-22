Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aiOig-0000Vx-2j
	for mharc-qemu-trivial@gnu.org; Tue, 22 Mar 2016 11:59:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1aiOcB-0006YX-Um
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 11:53:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1aiOcB-0000Uy-25
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 11:53:03 -0400
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:35356)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>)
	id 1aiOcA-0000Un-NN; Tue, 22 Mar 2016 11:53:02 -0400
Received: by mail-vk0-x233.google.com with SMTP id e6so259899793vkh.2;
	Tue, 22 Mar 2016 08:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fEhyGcCE4msNB3Xmy7A1W0OhDBs/2iLiOSNNR7ga2iE=;
	b=N2Gt3RPB5svJvhBspIZyhcYEP1EJrQM5BqfaCTfUgrSgYp7KCk9B5Yf8Qv4QxV2cJq
	mNlP7Ik01WJuyyY8HH0OHu+3+tLfWFh5oUiUgpDE94+rJakLm/b9lAIIXR87VqvSClSO
	wSkmoYgR5Tof9Rg8LFG9V+EN4i3jCcn/N7aEEXo+DAyRxIexDb/Zv9PSEWZudOVgRcA0
	XtTxoQ2eYJGyqyD7T/uY7kGIAPdRE89lRma195sODTkrOHn25e8Yl6FeNxMdo0mxfPQB
	Ytry4Dqr5kIZ4rXWwqseZkJMYQkIQ8yfLTunQazBFfWPHL8/yb/Zdo0EVAGW/inXc09M
	Su+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fEhyGcCE4msNB3Xmy7A1W0OhDBs/2iLiOSNNR7ga2iE=;
	b=UCaZNtX/Fbg3zqXZlgx7p36AAiepuB/rFGu5gTbYAdNAN7ZGDjn/rMwZnVN76P0IXf
	/5PKqFzIwsyPt7wSnNBAETCNMwa9LoPnFcmAgo1+KyzC/FjiBVL5hz+UfJ3b9uqT0tUr
	odUWTn7Dt/WfiX58UbQAU1HDyyd/ivksQed6cfJrvnBnIzzdCMB5PHe0uv0poeHpx8I7
	5oTnEqa2wv5DuGxEptuTfUqa0pXONLmZ0Wp3ijxUxytuyCnxSz0Nb20zVOtB84pfhVS5
	AIw16dQ94iK+G8G8/XJ856fjP4middDTulQXe00fSQVB6lnQbelzrb2mldUxeb+FYsyH
	7X4g==
X-Gm-Message-State: AD7BkJI4uR87QGVw1KqTsBladj3AH6zei+PE2kGHbfLPzhgotqYLyWyKUiQk5ZWp1IonhgbMthEGMsJOyD50Zw==
X-Received: by 10.31.13.140 with SMTP id 134mr7293951vkn.142.1458661982223;
	Tue, 22 Mar 2016 08:53:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.15.9 with HTTP; Tue, 22 Mar 2016 08:52:42 -0700 (PDT)
In-Reply-To: <877fgumtlk.fsf@blackfin.pond.sub.org>
References: <1458657219-12156-1-git-send-email-haris.phnx@gmail.com>
	<877fgumtlk.fsf@blackfin.pond.sub.org>
From: haris iqbal <haris.phnx@gmail.com>
Date: Tue, 22 Mar 2016 21:22:42 +0530
Message-ID: <CAE_WKMyY-BAAFj3B_kfwCRtsiksMp__VZdw0iznic8-ibYuGwA@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
X-Mailman-Approved-At: Tue, 22 Mar 2016 11:59:44 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Changed malloc() to
 g_malloc() at places where return value was not being checked
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
X-List-Received-Date: Tue, 22 Mar 2016 15:53:05 -0000

On Tue, Mar 22, 2016 at 8:45 PM, Markus Armbruster <armbru@redhat.com> wrote:
> Md Haris Iqbal <haris.phnx@gmail.com> writes:
>
>> Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
>> ---
>>  bsd-user/elfload.c | 2 +-
>>  bsd-user/qemu.h    | 2 +-
>>  linux-user/qemu.h  | 2 +-
>>  thunk.c            | 2 +-
>>  ui/shader.c        | 2 +-
>>  5 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
>> index 0a6092b..40bd1f2 100644
>> --- a/bsd-user/elfload.c
>> +++ b/bsd-user/elfload.c
>> @@ -1064,7 +1064,7 @@ static void load_symbols(struct elfhdr *hdr, int fd)
>>
>>   found:
>>      /* Now know where the strtab and symtab are.  Snarf them. */
>> -    s = malloc(sizeof(*s));
>> +    s = g_malloc(sizeof(*s));
>>      syms = malloc(symtab.sh_size);
>>      if (!syms) {
>>          free(s);
>
> You need to track down where s is freed and change from free() to
> g_free() there.  One such spot is visible in context.  Same for the
> rest of the patch.

On it. Thanks.

>
> [...]



-- 

With regards,

Md Haris Iqbal,
Placement Coordinator, MTech IT
NITK Surathkal,
Contact: +91 8861996962

