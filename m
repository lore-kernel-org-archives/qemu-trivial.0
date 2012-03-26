Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SCGCH-0006cN-5Y
	for mharc-qemu-trivial@gnu.org; Mon, 26 Mar 2012 16:07:21 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1SCGCE-0006Z3-0D
	for qemu-trivial@nongnu.org; Mon, 26 Mar 2012 16:07:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1SCGCA-0003nM-K6
	for qemu-trivial@nongnu.org; Mon, 26 Mar 2012 16:07:17 -0400
Received: from mail-yx0-f173.google.com ([209.85.213.173]:42716)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1SCGCA-0003mw-Ff
	for qemu-trivial@nongnu.org; Mon, 26 Mar 2012 16:07:14 -0400
Received: by yenr5 with SMTP id r5so5127596yen.4
	for <qemu-trivial@nongnu.org>; Mon, 26 Mar 2012 13:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=r+mY8MtFOGNWn9fbd5v2xT0ZqMTaURROkFtgMm28RWA=;
	b=LxqflF17stJCPzxatr0NE58ffhyTUEONUBvvw+ejrqTylIlrfMtG2DKrmH2M8q++hi
	EvgyPgV1BpjRkw5I/Xjil961knGQ5SJMo+k/96MG6/XUzc4nIq5AXppsWvhaZXOq1DEu
	GZhBq5zg5TcFZVyOSKCXt8JDe9cTxlmamUAod5t7Y6fq7bxKMETwxTMmlagoq3o3/yU2
	FlBgkXmzCowGuCbk9pf1xWdh9IHjf3a8yi4K5fD7YtjRWXSXtQm/j5TDMkSzk/laYMAm
	8GlCDsc65jTJ9LvjCTEzyyc0iFJ8307lmwGRRI3UVdr7FQPJwo/FHxhVNHYq3j/yq8s2
	8cHQ==
Received: by 10.60.3.104 with SMTP id b8mr28503863oeb.13.1332792432630;
	Mon, 26 Mar 2012 13:07:12 -0700 (PDT)
Received: from [192.168.0.108] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id d6sm13480951oeh.3.2012.03.26.13.07.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Mar 2012 13:07:11 -0700 (PDT)
Message-ID: <4F70CC6D.9050404@codemonkey.ws>
Date: Mon, 26 Mar 2012 15:07:09 -0500
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Michael Roth <mdroth@linux.vnet.ibm.com>
References: <1332202706-25061-1-git-send-email-mdroth@linux.vnet.ibm.com>
	<1332342646-9250-1-git-send-email-mdroth@linux.vnet.ibm.com>
In-Reply-To: <1332342646-9250-1-git-send-email-mdroth@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Gm-Message-State: ALoCoQmNkfn1vxky9YSuKcEd0New64WHj5JW+72m6HicgrjEB8ofHEdEycZpax/zULy4Fre4SZ3P
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] test: remove qemu-ga
	reference
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
X-List-Received-Date: Mon, 26 Mar 2012 20:07:19 -0000

On 03/21/2012 10:10 AM, Michael Roth wrote:
> This was added by mistake a while back.
>
> Signed-off-by: Michael Roth<mdroth@linux.vnet.ibm.com>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
>   Makefile       |    1 +
>   tests/Makefile |    2 +-
>   2 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 1bc3cb0..cab7c74 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -173,6 +173,7 @@ qemu-img-cmds.h: $(SRC_PATH)/qemu-img-cmds.hx
>   $(qapi-obj-y): $(GENERATED_HEADERS)
>   qapi-dir := $(BUILD_DIR)/qapi-generated
>   qemu-ga$(EXESUF): LIBS = $(LIBS_QGA)
> +qemu-ga$(EXESUF): QEMU_CFLAGS += -I $(qapi-dir)
>
>   gen-out-type = $(subst .,-,$(suffix $@))
>
> diff --git a/tests/Makefile b/tests/Makefile
> index c78ade1..354fdbb 100644
> --- a/tests/Makefile
> +++ b/tests/Makefile
> @@ -17,7 +17,7 @@ test-coroutine: test-coroutine.o qemu-timer-common.o async.o $(coroutine-obj-y)
>
>   test-qmp-input-visitor.o test-qmp-output-visitor.o \
>   test-string-input-visitor.o test-string-output-visitor.o \
> -	test-qmp-commands.o qemu-ga$(EXESUF): QEMU_CFLAGS += -I $(qapi-dir)
> +	test-qmp-commands.o: QEMU_CFLAGS += -I $(qapi-dir)
>
>   $(qapi-dir)/test-qapi-types.c $(qapi-dir)/test-qapi-types.h :\
>   $(SRC_PATH)/qapi-schema-test.json $(SRC_PATH)/scripts/qapi-types.py


