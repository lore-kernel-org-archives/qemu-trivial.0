Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1Yvq-0007ko-HG
	for mharc-qemu-trivial@gnu.org; Mon, 09 Oct 2017 10:21:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1e1Yvo-0007ji-NL
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 10:21:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1e1Yvn-0004CE-P6
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 10:21:20 -0400
Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243]:36469)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <gsomlo@gmail.com>)
	id 1e1Yvj-0004AL-8w; Mon, 09 Oct 2017 10:21:15 -0400
Received: by mail-io0-x243.google.com with SMTP id f202so8188338ioe.3;
	Mon, 09 Oct 2017 07:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=myINpvJbfZsNSUITkhRvhB6Ya6zJrLJNpsCCdFP/OlA=;
	b=Zk9/McQGhYUb1yIzxBAnJ8CLWRHzFCBoG+p1Ou37fNQeyWZiV1n/nG0TRsgbZaZd4u
	9wuw/SZ00qYe3M6D6N/jfvPHjmzd4zvW4iGEtYca9R9yAI5IUDyWgP2/18eb37I0GQkq
	AC1lUlp0mph6TNv0PI/jJSDUUKGbX8EleoRuiLZREbKg/88BEFi/ueipXyknjlugJQoW
	/L5KZoKFM6DV86engkCfc7hISYKAT9pGZqdC8qFtDH4nkcAKBRAplDqL8mdfDnpZKa1z
	iX1Cu1laEy/Ajwzior/VMHxyMdBlgttpuUXz72iM1CdW0AvD/1nmlx10dsUv2HwBoNC7
	e3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=myINpvJbfZsNSUITkhRvhB6Ya6zJrLJNpsCCdFP/OlA=;
	b=VBA7LqMfaipaxLUnyl911nTzWOg9KlJ814DJhawLl+gx3rVramYZXtGN9WbW9oAu2G
	WnnZAbpw3Ktt1tEOQAxn6ahGUd82M/JuvEuCmADs+auZgzlfIQqRgeIJR08QS5fRLxMD
	JKeukrUishwZf8j+LxZWVMuPJTZ5ofE9ziUMqGzlGvW7/GK76oD+NaD17VhvZoHAISlJ
	kkSFimtdKCfPxdziPhCrXCkVA2XdF9RgIx9zt6ATrvgqSmRnJFnE4TK1VVgPY4x9ZJUh
	AmWvaU51I8sADJHnFUFqaNPIGpK/ju9FQgeKaNsGV7so/Y+1JiAomhRY4tqvKCi+vCsF
	sUJQ==
X-Gm-Message-State: AMCzsaVD6EzGHO4fp7A1W6eVxjB4q71Nsh2NKXh5aooZjwMRTk9vQNAl
	aZizwDu3HBF0F0lbetHezUo=
X-Google-Smtp-Source: AOwi7QAROm+9lk3E5NWejKY4sap4c28dyFgQKV+t4JiRvOVK7CCpUAEt3TLtYjoUYSIAJOy7NureWg==
X-Received: by 10.107.107.11 with SMTP id g11mr14182442ioc.161.1507558874267; 
	Mon, 09 Oct 2017 07:21:14 -0700 (PDT)
Received: from hedwig.ini.cmu.edu (HEDWIG.INI.CMU.EDU. [128.2.16.51])
	by smtp.gmail.com with ESMTPSA id
	n142sm4083082itn.12.2017.10.09.07.21.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Oct 2017 07:21:12 -0700 (PDT)
Date: Mon, 9 Oct 2017 10:21:10 -0400
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Denis V. Lunev" <den@openvz.org>,
	Anton Nefedov <anton.nefedov@virtuozzo.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Message-ID: <20171009142109.GD8968@hedwig.ini.cmu.edu>
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-50-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20171006235023.11952-50-f4bug@amsat.org>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::243
Subject: Re: [Qemu-trivial] [PATCH 49/88] hw/misc: use g_new() family of
 functions
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
X-List-Received-Date: Mon, 09 Oct 2017 14:21:21 -0000

Reviewed-by: Gabriel Somlo <gsomlo@gmail.com>

On Fri, Oct 06, 2017 at 08:49:44PM -0300, Philippe Mathieu-Daudé wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> [PMD: added hw/misc/pvpanic.c]
> ---
>  hw/misc/applesmc.c | 2 +-
>  hw/misc/pvpanic.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
> index 7be8b5f13c..12e32b107e 100644
> --- a/hw/misc/applesmc.c
> +++ b/hw/misc/applesmc.c
> @@ -252,7 +252,7 @@ static void applesmc_add_key(AppleSMCState *s, const char *key,
>  {
>      struct AppleSMCData *def;
>  
> -    def = g_malloc0(sizeof(struct AppleSMCData));
> +    def = g_new0(struct AppleSMCData, 1);
>      def->key = key;
>      def->len = len;
>      def->data = data;
> diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
> index 2b1e9a6450..dc51e4386c 100644
> --- a/hw/misc/pvpanic.c
> +++ b/hw/misc/pvpanic.c
> @@ -95,7 +95,7 @@ static void pvpanic_isa_realizefn(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    pvpanic_port = g_malloc(sizeof(*pvpanic_port));
> +    pvpanic_port = g_new(uint16_t, 1);
>      *pvpanic_port = cpu_to_le16(s->ioport);
>      fw_cfg_add_file(fw_cfg, "etc/pvpanic-port", pvpanic_port,
>                      sizeof(*pvpanic_port));
> -- 
> 2.14.2
> 

