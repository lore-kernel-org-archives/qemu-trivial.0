Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gbkkI-00047v-EM
	for mharc-qemu-trivial@gnu.org; Tue, 25 Dec 2018 06:19:34 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gbkkD-00045e-PZ
	for qemu-trivial@nongnu.org; Tue, 25 Dec 2018 06:19:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gbkkA-00005p-Id
	for qemu-trivial@nongnu.org; Tue, 25 Dec 2018 06:19:29 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51252)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gbkkA-0008TE-CO
	for qemu-trivial@nongnu.org; Tue, 25 Dec 2018 06:19:26 -0500
Received: by mail-wm1-f66.google.com with SMTP id b11so12774167wmj.1
	for <qemu-trivial@nongnu.org>; Tue, 25 Dec 2018 03:19:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TkecxMI5RoqaKg5n3auzRoJFGbQiXnbSJsZoXS0BjjQ=;
	b=Aup9BBnw1L4NI435L6hZxJIQ4KMwH/sDPI/i/vzoQeL1cEY3wyuWcbQIGT3H0Z26HQ
	4tKZWX3J85/xWv1TplU6w1XrGuAfn1qq9oW9TVMliTNzxQcV5u/SQhokI5LgN4sLkJD9
	p+301EVH48FI52jh6kGeiP01JS4uAD/8YkssyQCjXeSMLPtGpf/0jrrSZCVpf0uh3EIr
	XOZxPO1OkU1nuvFo9lE8JyJCaaNvUsn0bx0KoIzumh6Uwsj4tADSANd3rKy/7AGwQ2AX
	7u8QChSVihBl7baZJj5hW4bwP+6fVISTskXhwD2NPBHPyhkRFTmBBfRplI8rKMPYaMaS
	6Dug==
X-Gm-Message-State: AJcUukfF/NgHIjNGS/cmw9k/BDuZbFQGLO0ADLdZAhxK+DpwcszW+KTj
	RwsWk/6E1aFBq32j6oMnyRQYFg==
X-Google-Smtp-Source: AFSGD/V0AAEnZiQym1/hMOtH96vvf6gudJUvp7meBUbaigJtqE2VyRJJC1AnTE7c9F6yk72iiymaEA==
X-Received: by 2002:a1c:6243:: with SMTP id w64mr14560930wmb.153.1545736764585;
	Tue, 25 Dec 2018 03:19:24 -0800 (PST)
Received: from [192.168.1.15] (abayonne-654-1-110-220.w86-222.abo.wanadoo.fr.
	[86.222.61.220]) by smtp.gmail.com with ESMTPSA id
	w18sm1406332wmi.12.2018.12.25.03.19.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Dec 2018 03:19:23 -0800 (PST)
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, ehabkost@redhat.com
References: <20181224154922.3338-1-wainersm@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d11ccc45-819f-7f16-cbb3-68b518cb3169@redhat.com>
Date: Tue, 25 Dec 2018 12:19:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181224154922.3338-1-wainersm@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/core: fix whitespace in
 a sentence
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
X-List-Received-Date: Tue, 25 Dec 2018 11:19:30 -0000

On 12/24/18 4:49 PM, Wainer dos Santos Moschetta wrote:
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/core/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 4439ea663f..a0beeeb2a9 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -591,7 +591,7 @@ static void machine_class_init(ObjectClass *oc, void *data)
>      object_class_property_add_bool(oc, "dump-guest-core",
>          machine_get_dump_guest_core, machine_set_dump_guest_core, &error_abort);
>      object_class_property_set_description(oc, "dump-guest-core",
> -        "Include guest memory in  a core dump", &error_abort);
> +        "Include guest memory in a core dump", &error_abort);
>  
>      object_class_property_add_bool(oc, "mem-merge",
>          machine_get_mem_merge, machine_set_mem_merge, &error_abort);
> 

