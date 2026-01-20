Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C6DD2ED0F
	for <qemu-trivial@archiver.kernel.org>; Tue, 20 Jan 2026 12:03:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1viARy-00050m-9L; Tue, 20 Jan 2026 07:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1viARw-0004yX-2A
 for qemu-trivial@nongnu.org; Tue, 20 Jan 2026 07:03:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1viARu-0004I2-Ca
 for qemu-trivial@nongnu.org; Tue, 20 Jan 2026 07:03:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768910584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vHAz0BJbdAQaWn3tqm5U93G4LyMZwJO1Eh6wuzVHc+s=;
 b=NBMT0aTslsLWmR1jS4t8SMkhFK+0m9YJ6D79BJRso1n2RZxofsUmu6EweY5u8C6MTpoDXa
 STluDPXiA4wPXT5aOvSwiqsh1KFDtVG7FCz0me5Xo1UoDodcJjDAEab4G4TM7iAIiLXKXl
 Kz3O3G0zD/i+VsjfH9cbiOflM9PWCAo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-wuuEL2v5MtiJ0c-iIsD_3g-1; Tue, 20 Jan 2026 07:03:02 -0500
X-MC-Unique: wuuEL2v5MtiJ0c-iIsD_3g-1
X-Mimecast-MFC-AGG-ID: wuuEL2v5MtiJ0c-iIsD_3g_1768910582
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b877f048350so767910266b.0
 for <qemu-trivial@nongnu.org>; Tue, 20 Jan 2026 04:03:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768910581; x=1769515381;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vHAz0BJbdAQaWn3tqm5U93G4LyMZwJO1Eh6wuzVHc+s=;
 b=rddL8S1rZbrTcuJ0tVVwIeYbjJAiaMKVQqtJeoYDAUbIAJSDYxGNsVplWHTORM5118
 oTnzNR1A7jpMBtEuoUKPj8ciqHAV/Zf6LwaL74rriLA6MkyBqkwe4V3JtJ9Uax+brGN0
 ExAiKNmz2e2cZimN/MPOmq1JZgtjNI/r6JfXTynxCuB9jdbu+cmq3y+/1CEcxVhh6kBm
 nz7oIiBiLGHvRC89YB13J8Mm9M9RW2R4ySVUIpETiPEx/RLSHifs7rB/3cwXjgF+2yH+
 v399CXFYkDIFfJT3UYw4XDexDHFUXcPT52qbmIrQs2+TOYej9PiIRSrFj5I14MXDauOZ
 IYyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzkkC0qHXDY69RDgmh3YBYxmsd9yX1G/Zhfa6LFN5mM5aeLAog4FdlvEnk/7EcTgjxauC8YO9AOj23bBs=@nongnu.org
X-Gm-Message-State: AOJu0YwNb/ogCpWMAB8XczSrKXcSJfwMXbhsfg5rGQCgoa4LSg59lCSl
 6l/3wY+YEVzuVJezEeA83wd9wM/vlG5REvj2HJuJosVc/eAlIX7IicSbsZWFdsFzJGZhqu1Akzj
 HmoGOkW9cofVcugkzQYNYAx5ChQKv3hZQDII1pJlr0zHsBhSy6SSYCcEs0rs=
X-Gm-Gg: AZuq6aK/0GvHE3eE21bTKZbqQVwgQg7+ifOaQIm5vArYa/9sHmCkdcTuKfK9R3KDnhJ
 FMRLCOPOWQ68KzEtDoULwkc6/lOgNmAVhqVTGhL++a+2IqeEXZMKJ8zg7PMqMeiRXRVFOq0rTKk
 wKDTeGcePRz0Lw8S+ReV40LirioWeQj1M9GS2+ljKGtnwj6xEX+FwwV1WEwnUslTp/ZejZDO/Q4
 V3Aa9jkiLqAEzofvXf8Z1my33nc7VDzkHABxlBMDZK9Bpx3EhiksTsR9mbTBa7ThNhJdaBy94eY
 zR/zCbf58fxN32MNc6jEYlWLAtx3XkAXikqve7haCLANGZZgnEsNqdJuS7KGI2jybTx2qYRflL2
 2U410
X-Received: by 2002:a17:907:3e12:b0:b87:322d:a8d0 with SMTP id
 a640c23a62f3a-b8792f8b97cmr1299593666b.41.1768910581549; 
 Tue, 20 Jan 2026 04:03:01 -0800 (PST)
X-Received: by 2002:a17:907:3e12:b0:b87:322d:a8d0 with SMTP id
 a640c23a62f3a-b8792f8b97cmr1299591366b.41.1768910581140; 
 Tue, 20 Jan 2026 04:03:01 -0800 (PST)
Received: from [192.168.0.9] ([47.64.113.5]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8795168c7bsm1455074366b.20.2026.01.20.04.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 04:03:00 -0800 (PST)
Message-ID: <35b3750b-31ab-4120-8edd-74aa1ae5f0bf@redhat.com>
Date: Tue, 20 Jan 2026 13:02:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] configure: Remove duplicated entry of --gdb in the help
 text
To: Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-trivial@nongnu.org, gustavo.romero@linaro.org
References: <20260114155355.82096-1-thuth@redhat.com>
 <878qe0jfgs.fsf@draig.linaro.org>
 <bc463c63-ec0c-4666-a9ed-7c53e02a24c4@tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <bc463c63-ec0c-4666-a9ed-7c53e02a24c4@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tkgwFigSSUBFTKlctjAt5BYow7lz5wSDMhdgDnKveF4_1768910582
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.087,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 20/01/2026 12.31, Michael Tokarev wrote:
> On 1/14/26 20:01, Alex Bennée wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>
>>> From: Thomas Huth <thuth@redhat.com>
>>>
>>> Since --gdb has recently been added to meson_options.txt, the help
>>> text shows up twice in the output of "./configure --help":
>>>
>>>   $ ./configure --help | grep gdb
>>>     --gdb=GDB-path           gdb to use for gdbstub tests [/usr/bin/gdb]
>>>     --gdb=VALUE              Path to GDB
>>
>> It's a shame to loose the default value - is there anyway for the meson
>> version to show the auto-detected value?
> 
> Maybe we can drop this line from meson but keep it in ./configure?

The meson stuff is generated automatically, so no clue how that could be 
done in a nice way?

  Thomas


