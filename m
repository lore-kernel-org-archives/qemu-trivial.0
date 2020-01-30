Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ixClE-0008S7-G4
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jan 2020 11:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ixClC-0008ON-0P
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2020 11:33:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ixClA-0008DM-Hj
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2020 11:33:41 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44762
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ixClA-00088Q-E1
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2020 11:33:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580402017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hNEA1GIzWXT/wo5gy6Vd0WcfjAAmLoSs3VyTc5jGVMc=;
 b=ANt02Et3tyJYas4jX9CFoxnh0qoTsJTdBECWmCPHe+/a08vQmvwVCzl26YRKjCX4VKNqYR
 C3qhqcRjeVzXZ+FFVuykzDpk3dwD93qNQWT703FEjoC9dSw+DPJxCYIVdl5gYkPBuiSJpy
 /+0jU0RjekjdYqmH2wkDXbAbeWiDVjw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-wAKB2NnwN8eCSK2FW9q1Rg-1; Thu, 30 Jan 2020 11:33:32 -0500
Received: by mail-wm1-f70.google.com with SMTP id y24so1197378wmj.8
 for <qemu-trivial@nongnu.org>; Thu, 30 Jan 2020 08:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Idgu1ovbdhEjBDTiMNMMknYRQxAZFr079uqbL8FDl/A=;
 b=YHPYcbRm9VThi3Zfz4Sd7lwsA8qB0UDPDgzFhLhOQUZAUo7kxhbdTKIZgrziDZ0EgF
 231x/ll6gerHcSCoMfw/JI7Fjy6i74jyC5tz1Jaefr+l225C7tFw+HJCTz0BxFBZnAtQ
 +8mR1l5XsljoA7GcCkC4S+b6vqTRQW73PAe5kkCs7i1MsOVeh5o6da05tWUhjIDIsj71
 6GqoZwl9NUkIj9DjDhJxVwvPKloaTFg2FhR/iU4IdmQyHS5UpeKlcydjd/FKc6Bfvplr
 io/gXMEKIKwZvlxCIL1/5amfwfqnrJqGRFf295qyCnTfslxOeBYGzBWrAoXQkGksc8zA
 MvrQ==
X-Gm-Message-State: APjAAAUAY/qcgc82lg7iWgfozEe2hKKBqLSg2r0GQlpr1QaWtq2EmpvE
 2jxBbIfAFg8pg39969U072kK0ld94i+M9jPkEEwMYTlGS3qThHEH/aN78MuQFr2JnZgVnirl2lq
 xI7Z0zKOQXGLgKIyQLQ==
X-Received: by 2002:adf:f850:: with SMTP id d16mr6349226wrq.161.1580402010983; 
 Thu, 30 Jan 2020 08:33:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqxedRCAD9LhGhFv/4AuZTMcHCAKEPcEd5gnPV6geTOku9onKmvBNZj9e1VHSmvjt1b2TTq36g==
X-Received: by 2002:adf:f850:: with SMTP id d16mr6349193wrq.161.1580402010715; 
 Thu, 30 Jan 2020 08:33:30 -0800 (PST)
Received: from [10.200.153.153] ([213.175.37.12])
 by smtp.gmail.com with ESMTPSA id c9sm7099750wme.41.2020.01.30.08.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2020 08:33:29 -0800 (PST)
Subject: Re: [PATCH v2] hw/*/Makefile.objs: Move many .o files to common-objs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20200130133841.10779-1-thuth@redhat.com>
 <871rrh9fkc.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8077a146-f190-a584-9700-e2931a2a3beb@redhat.com>
Date: Thu, 30 Jan 2020 17:33:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <871rrh9fkc.fsf@linaro.org>
Content-Language: en-US
X-MC-Unique: wAKB2NnwN8eCSK2FW9q1Rg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jan 2020 16:33:43 -0000

On 30/01/20 15:36, Alex Benn=C3=A9e wrote:
>=20
>> We have many files that apparently do not depend on the target CPU
>> configuration, i.e. which can be put into common-obj-y instead of
>> obj-y.
> While common-obj-y is still shared by linux-user this will also add
> slightly to user-only build times.

It won't, all the directories that Thomas is touching are under ifeq
($(CONFIG_SOFTMMU), y)...endif in hw/Makefile.objs.

> I'd like to see some separation of:
>=20
>  common-user-obj
>  common-sys-obj

That actually is done in the Meson conversion, where they are called
respectively user_ss and softmmu_ss ("ss" stands for sourceset).  They
are added like so to common_ss:

common_ss.add_all(when: 'CONFIG_SOFTMMU', if_true: softmmu_ss)
common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)

> and I guess the stuff already common to everything is already in
> libqemuutil.a

In my meson-poc branch, the only files that are added directly to
common_ss rather than softmmu_ss or user_ss are the files in hw/core and
the disassemblers.

Paolo


