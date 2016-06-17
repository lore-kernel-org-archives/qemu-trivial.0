Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bDuSl-0005ve-JR
	for mharc-qemu-trivial@gnu.org; Fri, 17 Jun 2016 10:09:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <atar4qemu@gmail.com>) id 1bDs6k-0003OX-OS
	for qemu-trivial@nongnu.org; Fri, 17 Jun 2016 07:38:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <atar4qemu@gmail.com>) id 1bDs6i-0001X8-Mp
	for qemu-trivial@nongnu.org; Fri, 17 Jun 2016 07:38:41 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:35817)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <atar4qemu@gmail.com>)
	id 1bDs6f-0001VO-06; Fri, 17 Jun 2016 07:38:37 -0400
Received: by mail-lf0-x244.google.com with SMTP id w130so8094880lfd.2;
	Fri, 17 Jun 2016 04:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QhYr9uSfJpjTfbcA8VCSjkTnRMN0M012Be1LtY0XzLc=;
	b=iA7z8TTp5HZvukl78XfvSYCuZChOvDr2ilRp0+ADKl6oFCk3GlU8hO2GCa+rle68ux
	iyrCd9F43226RpdDEEVTxRJImf47sCHMJzg7CHqS3tUb1zdma9UHLOwPC1+6LyFyIRgl
	EwhCvPrsewdlh78dYiOUZlfBSzGolcOnDvchqOncCpsAszsLA+aXmNLTrhgIQbsoNbpy
	Ca5ghw5kwjM/kd/cHM0iF8zkpy5QY7wIOnRjTIur8Mhpbin4KggtEvfmvu4gjXoo1NFI
	h/BNS4+OqPfJt6cqLj9C6WaL9ymKly+E4t8YtJp0iNd7qVnSm89aQU+3NcKX5h1YrocH
	LDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QhYr9uSfJpjTfbcA8VCSjkTnRMN0M012Be1LtY0XzLc=;
	b=AFoNzu/tDxz6iu55CdPmtqj/ci6D68E0fs0b3SlOSKGMqfDQR56BZQ6YvzYTWA4SOk
	p5N6/qMV0uucdavLjYjsU4UeK3pOKohBAiVXUI0Tw+ZkiNpdvl1A5YQ+LHVYc2zdyCKp
	/tV/lMQ2no1mfmuap95rChMTuuEDBSjcswLyN63+0hgzLVdsmC/4AwizElIUuyBwBkS+
	PRlVvBEPYOQY5NU+Nkn5HafIKTuhL4VIgyGMt7TKf7Fw6uvLi1HPUqcZtyd0Xkb2SHpa
	3cDkkexGN5TXFS7wnhBV35sRgjRf78+NWwOJfqG0znqOwNKN8dZ8PLZMa7TnhE7aVHWt
	Juyw==
X-Gm-Message-State: ALyK8tLbRDHw0FnA5h77utHrZ52HDTYrBFAEZwgI3kt79lk7NcboXbNs//ypo+PAnkdHM88lFLLEsaq46GAIrA==
X-Received: by 10.46.1.148 with SMTP id f20mr524174lji.52.1466163516203; Fri,
	17 Jun 2016 04:38:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.99.3 with HTTP; Fri, 17 Jun 2016 04:38:16 -0700 (PDT)
In-Reply-To: <1466098418-26899-1-git-send-email-thuth@redhat.com>
References: <1466098418-26899-1-git-send-email-thuth@redhat.com>
From: Artyom Tarasenko <atar4qemu@gmail.com>
Date: Fri, 17 Jun 2016 13:38:16 +0200
Message-ID: <CACXAS8BZ8OSNwsrBJW=3TuqOPbERVrRkpZGoY_z6_5WH8w-VTw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Blue Swirl <blauwirbel@gmail.com>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
X-Mailman-Approved-At: Fri, 17 Jun 2016 10:09:34 -0400
Subject: Re: [Qemu-trivial] [PATCH] sparc: Use g_memdup() instead of
 g_new0() + memcpy()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jun 2016 11:38:43 -0000

Acked-By: Artyom Tarasenko <atar4qemu@gmail.com>

On Thu, Jun 16, 2016 at 7:33 PM, Thomas Huth <thuth@redhat.com> wrote:
> There is no need to make sure that the memory is zeroed after the
> allocation if we also immediatly fill the whole buffer afterwards
> with memcpy(). Thus g_new0 should be g_new instead. But since we
> are also doing a memcpy() here, we can also simply replace both
> with g_memdup() instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target-sparc/cpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/target-sparc/cpu.c b/target-sparc/cpu.c
> index 5b74cfc..7b43192 100644
> --- a/target-sparc/cpu.c
> +++ b/target-sparc/cpu.c
> @@ -115,8 +115,7 @@ static int cpu_sparc_register(SPARCCPU *cpu, const char *cpu_model)
>          return -1;
>      }
>
> -    env->def = g_new0(sparc_def_t, 1);
> -    memcpy(env->def, def, sizeof(*def));
> +    env->def = g_memdup(def, sizeof(*def));
>
>      featurestr = strtok(NULL, ",");
>      cc->parse_features(CPU(cpu), featurestr, &err);
> --
> 1.8.3.1
>



-- 
Regards,
Artyom Tarasenko

SPARC and PPC PReP under qemu blog: http://tyom.blogspot.com/search/label/qemu

