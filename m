Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAXVI-0002cN-To
	for mharc-qemu-trivial@gnu.org; Wed, 28 Dec 2022 09:34:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@linaro.org>)
 id 1pAX5d-0004vs-FV
 for qemu-trivial@nongnu.org; Wed, 28 Dec 2022 09:07:29 -0500
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@linaro.org>)
 id 1pAX5c-0002vb-06
 for qemu-trivial@nongnu.org; Wed, 28 Dec 2022 09:07:29 -0500
Received: by mail-qk1-x734.google.com with SMTP id z17so7620851qki.11
 for <qemu-trivial@nongnu.org>; Wed, 28 Dec 2022 06:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IjYzbIVEorvmm2KU2QPmo8PUpVrTVTmlahAm1XCKAGA=;
 b=iQtJfow2wD6/7R1czNZ3JHLSP25ba+A7M7uCzN0Fd8yFsOnaOXihxya6BC9vo2m+Y0
 zDhS6/q9Fcf0ri/h3XXfPFxF0qu6kYiCc1j+8AIyc3SO5k3u4YH0N+rI1XfdW9zLQUud
 Ej0oG/mb03HFoYsP5Wj4gwcGxV6Ft9hYxfLyljrnuVw185iR7nohjPI6M0/FJvQHzSPk
 Hf7TDqS5X0NLPfIFKFqRTWvfoLKxMda1tNJN69BXKtBhaftH39xNEurApjJlN+WeCXyo
 FqMxTYxu3BELtExYlSXyZOmXq+cppOVAcrkOWAZ+usMzSPPmdXO/OddNispjmKf3qVwQ
 L7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IjYzbIVEorvmm2KU2QPmo8PUpVrTVTmlahAm1XCKAGA=;
 b=53bbe7qLjqw+vUriCqgKGKdyEFNe7Ug93C8Uot+ZAvCYZJ1iSjfk/cq1MDFaGuaPkQ
 P6EwXMNNUCn+0F5K3matFlmKzJvmW3mzoYikXijSFyALz4GpyqcwxH/pwudut8hc5tAa
 qc7ahcp3ndKISZsPmQ8NVkMWBXUBaDhNMn7rUk98h2JSqgcF2Y4FKdGqJtj3P5DYv7TT
 Z1ODT2/RQqGRthCkQ/CP/VUAFF5WZrqpIoy3yjR+6/FEFsTRJvfmj1NbA+hioVbU2+lP
 ca/agi2okjq645kbUz2wg5mIKX4icpB+vNtjPYAPN0MAvzp926Ns1bPlbgrt8luJoXYT
 Y0vQ==
X-Gm-Message-State: AFqh2koUxupF4tDTKQnpQ7hRjD6gxDz7KKzxO6qloBkvGPqTJDUj2/e5
 dAkxRKbH5txDQpPLDJs7oAzT3m8zlem4JxxsJmGHTQ==
X-Google-Smtp-Source: AMrXdXscONRei6ewKvw1rTSptydY9OHTuUsNjXnmZErLRBw4G9JuWK+m9EIln4JKV83H0JWDICmub2QgkN6n5LS7WFU=
X-Received: by 2002:a37:b93:0:b0:6ed:d040:c175 with SMTP id
 141-20020a370b93000000b006edd040c175mr1073627qkl.536.1672236446216; Wed, 28
 Dec 2022 06:07:26 -0800 (PST)
MIME-Version: 1.0
References: <20211027124531.57561-1-david@redhat.com>
 <20211027124531.57561-11-david@redhat.com>
 <8a2fb7aa-316d-b6bc-1e8d-da5678008825@linaro.org>
 <6a533ba5-5613-1f96-866a-974530fb10bc@redhat.com>
In-Reply-To: <6a533ba5-5613-1f96-866a-974530fb10bc@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Date: Wed, 28 Dec 2022 15:07:15 +0100
Message-ID: <CAPMQPEJ1Nk_8TZgo2r9NtGeV92NbdUUyCszbBxwcYH-ZpFu1iQ@mail.gmail.com>
Subject: Re: [PATCH v1 10/12] virtio-mem: Fix typo in
 virito_mem_intersect_memory_section() function name
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, 
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Hui Zhu <teawater@gmail.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>,
 kvm@vger.kernel.org, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=philippe.mathieu-daude@linaro.org; helo=mail-qk1-x734.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 28 Dec 2022 09:33:59 -0500
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
X-List-Received-Date: Wed, 28 Dec 2022 14:07:30 -0000

On Wed, 28 Dec 2022 at 15:06, David Hildenbrand <david@redhat.com> wrote:
> On 28.12.22 15:05, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 27/10/21 14:45, David Hildenbrand wrote:
> >> It's "virtio", not "virito".
> >>
> >> Signed-off-by: David Hildenbrand <david@redhat.com>
> >> ---
> >>    hw/virtio/virtio-mem.c | 12 ++++++------
> >>    1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> I already queued your patch :)

Thank you then! :)

