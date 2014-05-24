Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wo4i6-0003Yc-5d
	for mharc-qemu-trivial@gnu.org; Sat, 24 May 2014 01:41:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1Wo4i2-0003VJ-S8
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 01:41:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1Wo4i1-0002rS-Tj
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 01:41:30 -0400
Received: from mail-qc0-x22f.google.com ([2607:f8b0:400d:c01::22f]:59213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>)
	id 1Wo4hz-0002r9-9F; Sat, 24 May 2014 01:41:27 -0400
Received: by mail-qc0-f175.google.com with SMTP id w7so9485435qcr.34
	for <multiple recipients>; Fri, 23 May 2014 22:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GkZCAH44AIjmqxXpAlUnwijNw8i/ZBNrcQkrZssSzAU=;
	b=hAGGsZDbGxRO1SL90DwLQz2j7IXViGjeFJ9ybi7O3AJBhendo36TQW8+rtHiwp5l4E
	oxuJJ5ywtUREZKqRg3JTaX5YG9ynUKx7l0IgUk35lsj7Be9HfcuCimjHw74UAGpwhbY1
	f4OAsSZPbfSeHDanHeW9D+PXp5lIa8Un0y4OW3j2SnIt96RsQnazM7jE4S8scFJqsJ+X
	EhQrbykfnRQlg+gmQO+VURD6oB4iDCMfMgZgPjVZnc2hn3RiNWuccRttTFt+0XfIhz4o
	QHFwikv0An5MKeQCg513zG6CTlZyBs5agrO1dGz4NFMLvtR68rrZKBkNTrjSG9xjngqq
	Rnjg==
MIME-Version: 1.0
X-Received: by 10.224.28.65 with SMTP id l1mr13289174qac.81.1400910086313;
	Fri, 23 May 2014 22:41:26 -0700 (PDT)
Received: by 10.140.24.51 with HTTP; Fri, 23 May 2014 22:41:26 -0700 (PDT)
In-Reply-To: <148ba95b4d26522056d25fea8312b24760fe8289.1399641611.git.tamlokveer@gmail.com>
References: <cover.1399641611.git.tamlokveer@gmail.com>
	<148ba95b4d26522056d25fea8312b24760fe8289.1399641611.git.tamlokveer@gmail.com>
Date: Sat, 24 May 2014 13:41:26 +0800
Message-ID: <CACrq+iLY-=LdWui-NkV5wM75YDhodphDhBdnHdUE-whozXT=rg@mail.gmail.com>
From: Le Tan <tamlokveer@gmail.com>
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::22f
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Le Tan <tamlokveer@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH 1/4] arch_init: replace fprintf(stderr,
 ...) with error_report() in arch_init.c
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
X-List-Received-Date: Sat, 24 May 2014 05:41:32 -0000

There is a newer version of patch to fix this problem. I forgot to add
the version number when I sent the new patch. Add this comment just to
indicate that this patch should be dropped. :)

2014-05-10 7:55 GMT+08:00 Le Tan <tamlokveer@gmail.com>:
> Replace fprintf(stderr,...) with error_report() in the file
> arch_init.c. The trailing "\n"s of the @fmt argument have been removed
> because @fmt of error_report() should not contain newline.
>
> Signed-off-by: Le Tan <tamlokveer@gmail.com>
> ---
>  arch_init.c |   36 +++++++++++++++++-------------------
>  1 file changed, 17 insertions(+), 19 deletions(-)
>
> diff --git a/arch_init.c b/arch_init.c
> index 60c975d..0b41475 100644
> --- a/arch_init.c
> +++ b/arch_init.c
> @@ -921,12 +921,12 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
>      xh_len = qemu_get_be16(f);
>
>      if (xh_flags != ENCODING_FLAG_XBZRLE) {
> -        fprintf(stderr, "Failed to load XBZRLE page - wrong compression!\n");
> +        error_report("Failed to load XBZRLE page - wrong compression!");
>          return -1;
>      }
>
>      if (xh_len > TARGET_PAGE_SIZE) {
> -        fprintf(stderr, "Failed to load XBZRLE page - len overflow!\n");
> +        error_report("Failed to load XBZRLE page - len overflow!");
>          return -1;
>      }
>      /* load data and decode */
> @@ -936,11 +936,11 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
>      ret = xbzrle_decode_buffer(xbzrle_decoded_buf, xh_len, host,
>                                 TARGET_PAGE_SIZE);
>      if (ret == -1) {
> -        fprintf(stderr, "Failed to load XBZRLE page - decode error!\n");
> +        error_report("Failed to load XBZRLE page - decode error!");
>          rc = -1;
>      } else  if (ret > TARGET_PAGE_SIZE) {
> -        fprintf(stderr, "Failed to load XBZRLE page - size %d exceeds %d!\n",
> -                ret, TARGET_PAGE_SIZE);
> +        error_report("Failed to load XBZRLE page - size %d exceeds %d!",
> +                     ret, TARGET_PAGE_SIZE);
>          abort();
>      }
>
> @@ -957,7 +957,7 @@ static inline void *host_from_stream_offset(QEMUFile *f,
>
>      if (flags & RAM_SAVE_FLAG_CONTINUE) {
>          if (!block) {
> -            fprintf(stderr, "Ack, bad migration stream!\n");
> +            error_report("Ack, bad migration stream!");
>              return NULL;
>          }
>
> @@ -973,7 +973,7 @@ static inline void *host_from_stream_offset(QEMUFile *f,
>              return memory_region_get_ram_ptr(block->mr) + offset;
>      }
>
> -    fprintf(stderr, "Can't find block %s!\n", id);
> +    error_report("Can't find block %s!", id);
>      return NULL;
>  }
>
> @@ -1026,10 +1026,10 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
>                      QTAILQ_FOREACH(block, &ram_list.blocks, next) {
>                          if (!strncmp(id, block->idstr, sizeof(id))) {
>                              if (block->length != length) {
> -                                fprintf(stderr,
> -                                        "Length mismatch: %s: " RAM_ADDR_FMT
> -                                        " in != " RAM_ADDR_FMT "\n", id, length,
> -                                        block->length);
> +                                error_report(
> +                                             "Length mismatch: %s: " RAM_ADDR_FMT
> +                                             " in != " RAM_ADDR_FMT, id, length,
> +                                             block->length);
>                                  ret =  -EINVAL;
>                                  goto done;
>                              }
> @@ -1038,8 +1038,8 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
>                      }
>
>                      if (!block) {
> -                        fprintf(stderr, "Unknown ramblock \"%s\", cannot "
> -                                "accept migration\n", id);
> +                        error_report("Unknown ramblock \"%s\", cannot "
> +                                     "accept migration", id);
>                          ret = -EINVAL;
>                          goto done;
>                      }
> @@ -1186,12 +1186,10 @@ void select_soundhw(const char *optarg)
>
>              if (!c->name) {
>                  if (l > 80) {
> -                    fprintf(stderr,
> -                            "Unknown sound card name (too big to show)\n");
> +                    error_report("Unknown sound card name (too big to show)");
>                  }
>                  else {
> -                    fprintf(stderr, "Unknown sound card name `%.*s'\n",
> -                            (int) l, p);
> +                    error_report("Unknown sound card name `%.*s'", (int) l, p);
>                  }
>                  bad_card = 1;
>              }
> @@ -1214,13 +1212,13 @@ void audio_init(void)
>          if (c->enabled) {
>              if (c->isa) {
>                  if (!isa_bus) {
> -                    fprintf(stderr, "ISA bus not available for %s\n", c->name);
> +                    error_report("ISA bus not available for %s", c->name);
>                      exit(1);
>                  }
>                  c->init.init_isa(isa_bus);
>              } else {
>                  if (!pci_bus) {
> -                    fprintf(stderr, "PCI bus not available for %s\n", c->name);
> +                    error_report("PCI bus not available for %s", c->name);
>                      exit(1);
>                  }
>                  c->init.init_pci(pci_bus);
> --
> 1.7.9.5
>

