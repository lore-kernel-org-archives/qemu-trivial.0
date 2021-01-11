Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kz1JI-00019m-RJ
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2021 12:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kz1JH-00016y-AW
 for qemu-trivial@nongnu.org; Mon, 11 Jan 2021 12:48:55 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kz1JF-00054A-R4
 for qemu-trivial@nongnu.org; Mon, 11 Jan 2021 12:48:55 -0500
Received: by mail-wm1-x32b.google.com with SMTP id r4so37276wmh.5
 for <qemu-trivial@nongnu.org>; Mon, 11 Jan 2021 09:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=HjFjB02VUOcj2JDmR/K56mtMUPw1JqKruxO3gsfgtG0=;
 b=Z1BLHnk/IllfoIqIlxKJ0XD2wgjI2evX/5XsMH9aGtoY/foB5Zp0OZr8+O18Z54N3P
 vFsoIVlUr7x9Y30UZt1g+VOvY8vJ0NhhFFf2vN/wzVP3Kpz1pVqYsTLQ3muqdwj0v8Y5
 F9VbBO51j75TEHi3Hsgg7/C+0sYNIOp0sLXBtkDC9Q/35JGz6cyiqvyi3+ptkFR33Rvf
 3RBT2H7VMu8ETRySwN8DK70ixgS2jWeoVWpQS1Wylo7thAyY7nH2Kq28D8Zatl3+Bobs
 TdnNFPVrst4l7kXfPxCLsQ62wZ5e8A8OpP+u3d7lU4jKfBn2zsMJ+iKqTpkuPX5Vqm2S
 db4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=HjFjB02VUOcj2JDmR/K56mtMUPw1JqKruxO3gsfgtG0=;
 b=ZYKtFANkjzI7csKqmETEFt+HAvRIobsGRuxdjClZEGNfq+A4TTjpvmyjRoovVoEr5o
 zMR/1OR4ddiy1N3qSJ6zfzp/4rdin/ACdBUgk7h2uucvelJOa2O3jpjv276uKk/6Bw7d
 aqbAT7A19mGwRRVmbjEEtcbYtNrUorvaNy5yvWWio4i21sgUFwtmihkSkhXbUoPxPz0B
 dQkdEWLVP54/BUC+h2mnFoQ+OvG4xFjYijW5QYPEo8N5gADueOLdkEdsliWMFTqUcFqe
 UCdl173ypnWlqmBXFDfFQO44/CLyPfvQE+pMXgCGUq0WxB+gnXazAsvyLXmYOVf5oeB2
 DvPQ==
X-Gm-Message-State: AOAM533DkJFfR8iqLIJe1JMoNGUqIdov6VB87sWYKC8rM8eI2TFgCJNF
 GgS2OydJgahsS/iTZLBrmPPotA==
X-Google-Smtp-Source: ABdhPJxFl0pGJIm5UheooE53gyVfAACVfyEjNoEnS7yM3rBuAokl0gYAMKI4jSlEoOleDrcPABVpeg==
X-Received: by 2002:a1c:7213:: with SMTP id n19mr15554wmc.14.1610387332427;
 Mon, 11 Jan 2021 09:48:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o3sm396503wrc.93.2021.01.11.09.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:48:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B2CE01FF7E;
 Mon, 11 Jan 2021 17:48:50 +0000 (GMT)
References: <20210111152020.1422021-1-philmd@redhat.com>
 <20210111152020.1422021-3-philmd@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Huacai Chen <chenhuacai@kernel.org>, Greg Kurz
 <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, Amit Shah <amit@kernel.org>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, qemu-arm@nongnu.org, John Snow
 <jsnow@redhat.com>, qemu-s390x@nongnu.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Kevin Wolf
 <kwolf@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Jason Wang <jasowang@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, Halil
 Pasic <pasic@linux.ibm.com>, Fam Zheng <fam@euphon.net>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Cornelia Huck <cohuck@redhat.com>, David
 Hildenbrand <david@redhat.com>, qemu-block@nongnu.org, Christian
 Borntraeger <borntraeger@de.ibm.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <richard.henderson@linaro.org>, Laurent Vivier
 <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 2/2] sysemu: Let VMChangeStateHandler take boolean
 'running' argument
Date: Mon, 11 Jan 2021 17:48:41 +0000
In-reply-to: <20210111152020.1422021-3-philmd@redhat.com>
Message-ID: <87lfcznz3x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 11 Jan 2021 17:48:55 -0000


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> The 'running' argument from VMChangeStateHandler does not require
> other value than 0 / 1. Make it a plain boolean.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Seems reasonable

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

