Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwYYK-0008Bf-Cp
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 09:01:28 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SwYYD-0007st-Hi
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 09:01:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SwYYC-0001AC-BA
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 09:01:21 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:35052)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SwYXw-00014p-W6; Wed, 01 Aug 2012 09:01:05 -0400
Received: by lbok6 with SMTP id k6so335543lbo.4
	for <multiple recipients>; Wed, 01 Aug 2012 06:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1FBCBYAjtWO0IjzCpTJPAfbYyNilgWvY6hpeuiQr/io=;
	b=IbtN0+v/rYBqakqoNAbY3Nt7R/mzbiDRzFPRorPlXwT/qSGyV5Is6cprDKxhCnQE+p
	g0LgptYbOWnzQzJLFDDy/ujcnxsd20oWvJiTKvEYZWcr79N6Mosv6xpJ5fWN92l3qT82
	S8cuILsca8AFuC4Poi5zQ7mRJpCXFIiW7qXzOZRfbYhpa+6Dl0g/eNIwXIbygRHffz0a
	bcO+rajNJ6tP4hPP5XBRfS5anmxQDTWQHNsZ5t5eKABU/5H6oXdGUxrLi3qwcYVTbuiW
	p0xn9l3ExrTHSdi+9H1Dg1id9XaBuN7e6mqbZhc32S3QzUsA+8XNmUi/iUV81Ree9q8c
	1XIg==
MIME-Version: 1.0
Received: by 10.112.45.168 with SMTP id o8mr8070891lbm.88.1343826063371; Wed,
	01 Aug 2012 06:01:03 -0700 (PDT)
Received: by 10.112.71.73 with HTTP; Wed, 1 Aug 2012 06:01:03 -0700 (PDT)
In-Reply-To: <50192786.5080904@redhat.com>
References: <1343256304-32029-1-git-send-email-tylerwhall@gmail.com>
	<50192786.5080904@redhat.com>
Date: Wed, 1 Aug 2012 14:01:03 +0100
Message-ID: <CAJSP0QV_aZLQ37M0+d-8aVoru_w7kgLpg2Bi1qR-1b5VzUFLKg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Avi Kivity <avi@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Tyler Hall <tylerwhall@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] exec.c: Fix off-by-one
	error in register_subpage
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
X-List-Received-Date: Wed, 01 Aug 2012 13:01:27 -0000

On Wed, Aug 1, 2012 at 1:56 PM, Avi Kivity <avi@redhat.com> wrote:
> On 07/26/2012 01:45 AM, Tyler Hall wrote:
>> subpage_register() expects "end" to be the last byte in the mapping.
>> Registering a non-page-aligned memory region that extends up to or
>> beyond a page boundary causes subpage_register() to silently fail
>> through the (end >= PAGE_SIZE) check.
>>
>> This bug does not cause noticeable problems for mappings that do not
>> extend to a page boundary, though they do register an extra byte.
>
> Reviewed-by: Avi Kivity <avi@redhat.com>

Thanks Avi.  Does this include Patch 2/2 too?

https://lists.gnu.org/archive/html/qemu-devel/2012-07/msg03573.html

Stefan

