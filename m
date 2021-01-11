Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kz1IS-0008OQ-KD
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2021 12:48:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kz1IM-0008Ll-LM
 for qemu-trivial@nongnu.org; Mon, 11 Jan 2021 12:48:00 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kz1IH-0004tv-SO
 for qemu-trivial@nongnu.org; Mon, 11 Jan 2021 12:47:58 -0500
Received: by mail-wr1-x436.google.com with SMTP id w5so624620wrm.11
 for <qemu-trivial@nongnu.org>; Mon, 11 Jan 2021 09:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7PomrZU0jMeuj2pSx76rGsVMpY5/lWRJj77kNrVmTOQ=;
 b=eN3dBxOzR44brDRBdWt3v4cXwY6j30skPdqKuTGRWe/DKoQpXBEbYCNfUfWnxSmOMu
 XBy0JNbmcqHL9/5eTyQHRZK0TylvdmoTIQtrHYnXogIczvSNKQKMvqS2IDa41gSpOeb0
 jCa+KqJnWspIoTNo5Vo72FWylPM+UqOOAL93Y9lhyE/E+JSasH8i1x5Qt4PEIRazuKwW
 47iItS+Yn4S8d/GkngwvwwLE36JBsUFx206rpGBdpMxlY9JBo+PoakQ2ux2Lr1L6YVLy
 T4Sq750nq5cgVMPwYor3Gt9Bgx5x9vcasoQAVPtwwZubrFxLtHxMm/RPTAu3LFDIRtjD
 wmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7PomrZU0jMeuj2pSx76rGsVMpY5/lWRJj77kNrVmTOQ=;
 b=T/97sAuIzo9/NSevgUlwFOdlop/ZiMlBA9+i/SwxjdL8LIYoupZeVSrol7uDd5k2+2
 S87LOWl7Vf9Vii706ubt7Wap3COQHY0UZFSPEUL0Grg2JBIETExPwiDmKQzCm/mwhF2E
 HKdmneKtNVIJ4sBFjZb3ksRBmkbJpGzwWwpvrn2oqHDm8xoXIOIFhSauqZFqo8iBBz0e
 rHMR3tnMZhGA+ZwBQPAmwNgOdZIpdgiW1Wl37/Oi0E+QYgJIdjVc8wZh6C6pqdo1OWye
 Vz3nGuXy8vUoQ6KWosUcLBXU9kYcng9IoWAyLBNPq7MA/rBCqztE+xaNuBDEjlwH5Pcu
 GGoQ==
X-Gm-Message-State: AOAM533A5XG9Zy/VdLZOle1SfpesvRNEk3mmuiN1vU0R5CIuy4leiApy
 jGtWDs6fXso1WnZqh0unN076lw==
X-Google-Smtp-Source: ABdhPJyEoJCuSw+5tRtzaJyx6mVyGEBtWFwj20lKG9ywN4EzrcnynxBCh/RF0f45AqXVj56ADnb/VQ==
X-Received: by 2002:a5d:5385:: with SMTP id d5mr269757wrv.384.1610387272416;
 Mon, 11 Jan 2021 09:47:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v20sm26616wml.34.2021.01.11.09.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:47:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8337D1FF7E;
 Mon, 11 Jan 2021 17:47:50 +0000 (GMT)
References: <20210111152020.1422021-1-philmd@redhat.com>
 <20210111152020.1422021-2-philmd@redhat.com>
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
Subject: Re: [PATCH 1/2] sysemu/runstate: Let runstate_is_running() return bool
Date: Mon, 11 Jan 2021 17:46:36 +0000
In-reply-to: <20210111152020.1422021-2-philmd@redhat.com>
Message-ID: <87o8hvnz5l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 11 Jan 2021 17:48:00 -0000


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> runstate_check() returns a boolean. runstate_is_running()
> returns what runstate_check() returns, also a boolean.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

