Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T87pR-0003Rw-U1
	for mharc-qemu-trivial@gnu.org; Sun, 02 Sep 2012 06:54:57 -0400
Received: from eggs.gnu.org ([208.118.235.92]:52815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1T87pQ-0003Ov-4q
	for qemu-trivial@nongnu.org; Sun, 02 Sep 2012 06:54:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1T87pP-0004Rt-6x
	for qemu-trivial@nongnu.org; Sun, 02 Sep 2012 06:54:56 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:36243)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1T87pN-0004Rb-3Z; Sun, 02 Sep 2012 06:54:53 -0400
Received: by iakx26 with SMTP id x26so6576671iak.4
	for <multiple recipients>; Sun, 02 Sep 2012 03:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rx8rDbaOn7E2e52GMXyx4KKb0jQLpXtRfJXxanaIED0=;
	b=nZpILzzlpbdDhdzGxPJEtvYdCduIOfqXPN6ek5kJ5lw81VO4wz32qur4oHs9ILIAag
	eXjLEFqhh45wxyhKCgn7NJLXYXM0JOxcz7KVU341+k+E1VmGQfBpmm3YZCAn4Y5GkYSV
	bCX9LwlIRJwnLyAOaNoGQWKRNtf0v/PROxVTz8r3F5sKoDeu87gX/kQMxyd936zHdETK
	srU71EaNa+sTFtGlxNL8VF+wixRMLMUHjRJd9WxX4a93ZkcYs0QTbJtfV/OKJfWrsh4K
	fhkvF5DIPRZ1J194vTHbjqHqqwguzBfsEjNzYYJ1nA79HHAAcpNUZ331BFz10CfIq9i7
	8VKA==
Received: by 10.50.159.226 with SMTP id xf2mr7950083igb.41.1346583292487; Sun,
	02 Sep 2012 03:54:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.78.161 with HTTP; Sun, 2 Sep 2012 03:54:32 -0700 (PDT)
In-Reply-To: <1346532470-15859-1-git-send-email-Don@CloudSwitch.com>
References: <1346532470-15859-1-git-send-email-Don@CloudSwitch.com>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sun, 2 Sep 2012 10:54:32 +0000
Message-ID: <CAAu8pHsbxJrO+rRG8Hs8V9y65gm1RHJ0+UGWjxLapZatvVw5AA@mail.gmail.com>
To: Don Slutz <Don@cloudswitch.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-i386: Report on
	error during cpu_x86_register().
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
X-List-Received-Date: Sun, 02 Sep 2012 10:54:57 -0000

On Sat, Sep 1, 2012 at 8:47 PM, Don Slutz <Don@cloudswitch.com> wrote:
> Send it to stderr before free of the details.
>
> Signed-off-by: Don Slutz <Don@CloudSwitch.com>
> ---
>  target-i386/cpu.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> index 57c064f..5c0fef1 100644
> --- a/target-i386/cpu.c
> +++ b/target-i386/cpu.c
> @@ -1352,6 +1352,7 @@ int cpu_x86_register(X86CPU *cpu, const char *cpu_model)
>      }
>      object_property_set_str(OBJECT(cpu), def->model_id, "model-id", &error);
>      if (error_is_set(&error)) {
> +        fprintf(stderr, "%s: %s\n", __FUNCTION__, error_get_pretty(error));

__func__ is preferred by checkpatch.pl and also GCC recommends using it:
http://gcc.gnu.org/onlinedocs/gcc/Function-Names.html

>          error_free(error);
>          return -1;
>      }
> --
> 1.7.1
>
>

