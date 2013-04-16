Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1USDyF-0008NI-GW
	for mharc-qemu-trivial@gnu.org; Tue, 16 Apr 2013 18:03:23 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55836)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1USDyB-0008Im-Po
	for qemu-trivial@nongnu.org; Tue, 16 Apr 2013 18:03:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1USDy9-0003Ul-MX
	for qemu-trivial@nongnu.org; Tue, 16 Apr 2013 18:03:19 -0400
Received: from mail-qe0-f43.google.com ([209.85.128.43]:60943)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1USDy9-0003UX-HC
	for qemu-trivial@nongnu.org; Tue, 16 Apr 2013 18:03:17 -0400
Received: by mail-qe0-f43.google.com with SMTP id f6so568299qej.2
	for <qemu-trivial@nongnu.org>; Tue, 16 Apr 2013 15:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:in-reply-to:references:user-agent
	:date:message-id:mime-version:content-type:x-gm-message-state;
	bh=5055+NldPHb9QzY1CnAIvlEyzFjpU2LGp4YQKVYWf4s=;
	b=hWvnWgrIAHUIzMi6vwXSjoad7f6UIbEGjX5M79kmofl+Q3Qb17QMKZ/NCSK5axFjiD
	ToPWp+vYdgc+J591uPuDSUwaziZUNmQb/a6cntdQ45nGr9uuziPfd8wIwnpOOk/1bXv2
	gd+LC7ZuozbD8/2IIxY0+IooDkOaXAhLTCzo+I9zofemcEF5j0wVcRVUd5blmFeCX3op
	IG2BJwfS8Qvftx2qSHkO/eTqSrGxwZzwwLoF74p+1cH2cKzGhe0bmfQjkDeMo4r2+075
	Rzts2+Z3hOZXTPPLZSOfQofwY0LG0DhHQ9Ht30V23tMGBdHAGzuaZax970Qo4ysYbIWx
	TAhg==
X-Received: by 10.49.128.33 with SMTP id nl1mr5018241qeb.45.1366149797139;
	Tue, 16 Apr 2013 15:03:17 -0700 (PDT)
Received: from titi.smtp.gmail.com ([32.97.110.51])
	by mx.google.com with ESMTPS id z2sm5897711qad.4.2013.04.16.15.03.15
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 15:03:16 -0700 (PDT)
From: Anthony Liguori <anthony@codemonkey.ws>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
In-Reply-To: <1366149041-626-1-git-send-email-eblake@redhat.com>
References: <1366149041-626-1-git-send-email-eblake@redhat.com>
User-Agent: Notmuch/0.15.2+77~g661dcf8 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Tue, 16 Apr 2013 17:03:13 -0500
Message-ID: <87k3o2dtge.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Gm-Message-State: ALoCoQmqZNI3ZyFU0QpKokRjgpmZ7hqFKESvS7iBIGnPC6vSpDgUnYH7dScD5T3+5iQhl4pTmH+y
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.128.43
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, phrdina@redhat.com,
	Stefan Hajnoczi <stefanha@redhat.com>, quintela@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration: reflect incoming
	failure to shell
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
X-List-Received-Date: Tue, 16 Apr 2013 22:03:21 -0000

Eric Blake <eblake@redhat.com> writes:

> Management apps like libvirt don't know to pay attention to
> stderr unless there is a non-zero exit status.
>
> * migration.c (process_incoming_migration_co): Exit with non-zero
> status on failure.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>

It looks like the migration coroutine cleans itself so there's no
obvious way to propagate the error.  A nicer cleanup would be to switch
the fprintf to error_report() too but this is certainly better than what
we have now.

Maybe we need an error_report_fatal()...

Reviewed-by: Anthony Liguori <aliguori@us.ibm.com>

Regards,

Anthony Liguori


> ---
>
> Noticed while reviewing:
> https://lists.gnu.org/archive/html/qemu-devel/2013-04/msg03293.html
> and it seems blatant enough to fix now, rather than waiting for
> Pavel's series to stabilize.
>
> Side note: libvirt explicitly forbids all use of exit({0,1}), and
> instead encourages exit(EXIT_{SUCCESS,FAILURE}), precisely because
> it makes it harder to slip in unintentional successful exits.
>
>  migration.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/migration.c b/migration.c
> index 3b4b467..3eb0fad 100644
> --- a/migration.c
> +++ b/migration.c
> @@ -99,7 +99,7 @@ static void process_incoming_migration_co(void *opaque)
>      qemu_fclose(f);
>      if (ret < 0) {
>          fprintf(stderr, "load of migration failed\n");
> -        exit(0);
> +        exit(EXIT_FAILURE);
>      }
>      qemu_announce_self();
>      DPRINTF("successfully loaded vm state\n");
> -- 
> 1.8.1.4

