Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oAzzr-0001ER-Ft
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jul 2022 16:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oAzzp-0001E7-EK
 for qemu-trivial@nongnu.org; Mon, 11 Jul 2022 16:27:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oAzzl-0006gu-0j
 for qemu-trivial@nongnu.org; Mon, 11 Jul 2022 16:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657571223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O5jAjtuCki81mycrpYe4J+ixm1jB/ap4W9xHAm6OMEI=;
 b=MuQD44PB6gNI93vYqFs1arAxKlyL+JCNvnoLfqqoJjs37J0vl0ptgjzaO7HwywSQpefJQX
 K8SJXe6+bRoaqFDvpuwV6uSrT+6mbaO+u4xS7BLEVJYIiZCn4P4DsJMpbJRP9WzYU7PQW7
 pPHGyCU8V2fRquFGveDRlfsi66PfaAU=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-2XG2M2uWPdiBF4KeCDsS6g-1; Mon, 11 Jul 2022 16:26:59 -0400
X-MC-Unique: 2XG2M2uWPdiBF4KeCDsS6g-1
Received: by mail-vk1-f199.google.com with SMTP id
 q204-20020a1f2ad5000000b0037492e52809so2464210vkq.2
 for <qemu-trivial@nongnu.org>; Mon, 11 Jul 2022 13:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O5jAjtuCki81mycrpYe4J+ixm1jB/ap4W9xHAm6OMEI=;
 b=RIJxb9fNptu49jN9RCrq2pLWL+eh9OADsf+SvL+RP7CWXYG4VFv+CJpZ5suMcyvycU
 lK+6cpQ2me9xOwEFhPwpANLWMjCZYHalC1ecv3UbWND9V8xuRTm+obpqcP+S5ZYdoBYJ
 MoJcI6au2L4uu1TZJLRIXk0NR42TXJyFYARzmZ9yHZnp3qcb6+ETpf6GCTIRKJC8bgS9
 lMrM4mgwbfk961TWf//h8jovZiQtYnGmumEE/+6N63iMqEQDyybmdT/fmYSc6CQl0ns1
 dNZms6zyZW0oFLlCQZyTnvGWLwmeHRif0jZAXKkHUcFGzFa6p0Fuu79elSg+GVG/4wSt
 A2VQ==
X-Gm-Message-State: AJIora+6Q1mXYFsys1sL4b+OG2sQXA4btn+CSDP7EmYrrL6UttZMv/0K
 hRkLKfwWa1ZUw84ryFyuTLMv76euxWAD76seSCXOrTh05PZwf7hB8N3Ap/756ygkjns9drORR0H
 7cLpTFca654Ov6sZD60fNkFdocY23LXv7vQ==
X-Received: by 2002:a1f:2c11:0:b0:374:dd20:2e67 with SMTP id
 s17-20020a1f2c11000000b00374dd202e67mr724955vks.3.1657571218471; 
 Mon, 11 Jul 2022 13:26:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tMCDCYbwn2hn8wFEHgG6WAd2BDmm/uUjqf9dD4ffn6J3km298DHf4fLyxCPRRMnFZPJcIT2SdXrv0YIwXeuH0=
X-Received: by 2002:a1f:2c11:0:b0:374:dd20:2e67 with SMTP id
 s17-20020a1f2c11000000b00374dd202e67mr724949vks.3.1657571218253; Mon, 11 Jul
 2022 13:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220711095300.60462-1-thuth@redhat.com>
In-Reply-To: <20220711095300.60462-1-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 11 Jul 2022 16:26:47 -0400
Message-ID: <CAFn=p-Yro-K_j7DL0NBr7hKbHxZnYtgvUvLED8n0L6+fBaLvBw@mail.gmail.com>
Subject: Re: [PATCH] Replace 'whitelist' with 'allow'
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
 Eric Blake <eblake@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jul 2022 20:27:09 -0000

On Mon, Jul 11, 2022 at 5:53 AM Thomas Huth <thuth@redhat.com> wrote:
>
> Let's use more inclusive language here and avoid terms
> that are frowned upon nowadays.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>  docs/devel/submitting-a-patch.rst | 2 +-
>  docs/tools/qemu-nbd.rst           | 2 +-
>  scripts/vmstate-static-checker.py | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
> index 09a8d12c2c..fec33ce148 100644
> --- a/docs/devel/submitting-a-patch.rst
> +++ b/docs/devel/submitting-a-patch.rst
> @@ -39,7 +39,7 @@ ideas from other posts. If you do subscribe, be prepared for a high
>  volume of email, often over one thousand messages in a week. The list is
>  moderated; first-time posts from an email address (whether or not you
>  subscribed) may be subject to some delay while waiting for a moderator
> -to whitelist your address.
> +to allow your address.
>
>  The larger your contribution is, or if you plan on becoming a long-term
>  contributor, then the more important the rest of this page becomes.
> diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
> index 8e08a29e89..faf6349ea5 100644
> --- a/docs/tools/qemu-nbd.rst
> +++ b/docs/tools/qemu-nbd.rst
> @@ -225,7 +225,7 @@ disconnects:
>    qemu-nbd -f qcow2 file.qcow2
>
>  Start a long-running server listening with encryption on port 10810,
> -and whitelist clients with a specific X.509 certificate to connect to
> +and allow clients with a specific X.509 certificate to connect to
>  a 1 megabyte subset of a raw file, using the export name 'subset':
>
>  ::
> diff --git a/scripts/vmstate-static-checker.py b/scripts/vmstate-static-checker.py
> index 539ead62b4..b369388360 100755
> --- a/scripts/vmstate-static-checker.py
> +++ b/scripts/vmstate-static-checker.py
> @@ -40,7 +40,7 @@ def check_fields_match(name, s_field, d_field):
>          return True
>
>      # Some fields changed names between qemu versions.  This list
> -    # is used to whitelist such changes in each section / description.
> +    # is used to allow such changes in each section / description.
>      changed_names = {
>          'apic': ['timer', 'timer_expiry'],
>          'e1000': ['dev', 'parent_obj'],
> --
> 2.31.1
>


