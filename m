Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1riDHg-0001kA-HD
	for mharc-qemu-trivial@gnu.org; Thu, 07 Mar 2024 07:55:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1riDHb-0001iy-7G
 for qemu-trivial@nongnu.org; Thu, 07 Mar 2024 07:55:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1riDHX-0004vy-RG
 for qemu-trivial@nongnu.org; Thu, 07 Mar 2024 07:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709816129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=at8BC76ZbcOCvnYmCuLdtC1vcmwWzolgXKE7VcZPyGU=;
 b=DK6T6EYZNrvZfW9fK6uxsHoqId1kjHalThQsNc4E1sOn/N6BvRPA81fF9HGTgD4tiAoqMo
 0WI1qbGd87MsD7+r4JAWCAcUpOjbgO7BjY1xxAwhK+1n4ZK4CB++h4qOormB+WZu2DzZEn
 KF/ymh9dUi01A923DR8NHyUmwlS49CI=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-Bl1uz9InMBOt97SZHdyX4Q-1; Thu, 07 Mar 2024 07:55:28 -0500
X-MC-Unique: Bl1uz9InMBOt97SZHdyX4Q-1
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-3c1aa386e5eso830103b6e.0
 for <qemu-trivial@nongnu.org>; Thu, 07 Mar 2024 04:55:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709816126; x=1710420926;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=at8BC76ZbcOCvnYmCuLdtC1vcmwWzolgXKE7VcZPyGU=;
 b=KoA11xewOInA8VrAkShzMINytgm/L7w5ZxKICw5cUggqdKkBB3OOMKw9qu2LEI/UzR
 Wy4DKHoqPYUir05KzS/RJj95ZXwUELPqGB+gIL0gZrmHlpDprQilfeBvl5cli08CI3OJ
 XmM0X8PTkPHf6LeuN7eXoy34yWxfUWWl9y/ChQSExnzbicWf3c1sY3rXKO40jvf744kL
 9igMqs9aax2q0+6pDQtb+C11H0ED5TLIBUJQWANXzAYLPDjkO1uZ+FpA7QuFfDwbr5W0
 +tfGcE+LfuXvGqEXSb4+ni5EmddWGWJg/XHPFeoqaVWhFIUPMysh80QtDekXDdm70mGq
 NHiw==
X-Gm-Message-State: AOJu0YwOvKGll1jiXGVARaD0rFs4dZHwP4mhwykVSFyp24gq4kMlelD6
 nXd8AF1Fw5Zq9Mpq+fHAcai6qwr48JgwS2xUU7Lx8tbqeENDz9SSk82BHi4fbt9jzicFJ0/cCZw
 A2iJKU4Cgc6C8o4iT9NYSsZXRWBoaTGEsg0rYxjW8jjDTxrfaF2tg+Ag=
X-Received: by 2002:a05:6808:634c:b0:3c1:c8fb:89f9 with SMTP id
 eb12-20020a056808634c00b003c1c8fb89f9mr7526144oib.39.1709816126416; 
 Thu, 07 Mar 2024 04:55:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH56NG/TchSst+ygxKgGqdok3zc30lHjLaOpFlHLmVemFO9i0I266u1rapCbapRiG2YfRT+nA==
X-Received: by 2002:a05:6808:634c:b0:3c1:c8fb:89f9 with SMTP id
 eb12-20020a056808634c00b003c1c8fb89f9mr7526132oib.39.1709816126006; 
 Thu, 07 Mar 2024 04:55:26 -0800 (PST)
Received: from localhost.localdomain ([116.73.135.231])
 by smtp.googlemail.com with ESMTPSA id
 x7-20020a626307000000b006e624f5c866sm7288282pfb.145.2024.03.07.04.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 04:55:25 -0800 (PST)
From: Ani Sinha <anisinha@redhat.com>
To: Ani Sinha <anisinha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] docs/acpi/bits: add some clarity and details and improve
 formating
Date: Thu,  7 Mar 2024 18:25:18 +0530
Message-ID: <20240307125518.6268-1-anisinha@redhat.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.583,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 07 Mar 2024 12:55:35 -0000

Update bios-bits docs to add more details on why a pre-OS environment for
testing bioses is useful. Add author's FOSDEM talk link.

CC: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 docs/devel/acpi-bits.rst | 55 ++++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
index 9677b0098f..1ec394f5fb 100644
--- a/docs/devel/acpi-bits.rst
+++ b/docs/devel/acpi-bits.rst
@@ -1,26 +1,48 @@
 =============================================================================
 ACPI/SMBIOS avocado tests using biosbits
 =============================================================================
-
+************
+Introduction
+************
 Biosbits is a software written by Josh Triplett that can be downloaded
 from https://biosbits.org/. The github codebase can be found
-`here <https://github.com/biosbits/bits/tree/master>`__. It is a software that executes
-the bios components such as acpi and smbios tables directly through acpica
-bios interpreter (a freely available C based library written by Intel,
+`here <https://github.com/biosbits/bits/tree/master>`__. It is a software that
+executes the bios components such as acpi and smbios tables directly through
+acpica bios interpreter (a freely available C based library written by Intel,
 downloadable from https://acpica.org/ and is included with biosbits) without an
-operating system getting involved in between.
+operating system getting involved in between. Bios-bits has python integration
+with grub so actual routines that executes bios components can be written in
+python instead of bash-ish (grub's native scripting language).
 There are several advantages to directly testing the bios in a real physical
-machine or VM as opposed to indirectly discovering bios issues through the
-operating system. For one thing, the OSes tend to hide bios problems from the
-end user. The other is that we have more control of what we wanted to test
-and how by directly using acpica interpreter on top of the bios on a running
-system. More details on the inspiration for developing biosbits and its real
-life uses can be found in [#a]_ and [#b]_.
+machine or in a VM as opposed to indirectly discovering bios issues through the
+operating system (the OS). Operating systems tend to bypass bios problems and
+hide them from the end user. We have more control of what we wanted to test and
+how by being as close to the bios on a running system as possible without a
+complicated software component such as an operating system coming in between.
+Another issue is that we cannot exercise bios components such as ACPI and
+SMBIOS without being in the highest hardware privilege level, ring 0 for
+example in case of x86. Since the OS executes from ring 0 whereas normal user
+land software resides in unprivileged ring 3, operating system must be modified
+in order to write our test routines that exercise and test the bios. This is
+not possible in all cases. Lastly, test frameworks and routines are preferably
+written using a high level scripting language such as python. OSes and
+OS modules are generally written using low level languages such as C and
+low level assembly machine language. Writing test routines in a low level
+language makes things more cumbersome. These and other reasons makes using
+bios-bits very attractive for testing bioses. More details on the inspiration
+for developing biosbits and its real life uses can be found in [#a]_ and [#b]_.
+
 For QEMU, we maintain a fork of bios bits in gitlab along with all the
-dependent submodules here: https://gitlab.com/qemu-project/biosbits-bits
+dependent submodules `here <https://gitlab.com/qemu-project/biosbits-bits>`__.
 This fork contains numerous fixes, a newer acpica and changes specific to
 running this avocado QEMU tests using bits. The author of this document
-is the sole maintainer of the QEMU fork of bios bits repo.
+is the sole maintainer of the QEMU fork of bios bits repository. For more
+information, please see author's `FOSDEM talk on this bios-bits based test
+framework <https://fosdem.org/2024/schedule/event/fosdem-2024-2262-exercising-qemu-generated-acpi-smbios-tables-using-biosbits-from-within-a-guest-vm-/>`__.
+
+*********************************
+Description of the test framework
+*********************************
 
 Under the directory ``tests/avocado/``, ``acpi-bits.py`` is a QEMU avocado
 test that drives all this.
@@ -120,8 +142,9 @@ Under ``tests/avocado/`` as the root we have:
        (b) Add a SPDX license header.
        (c) Perform modifications to the test.
 
-   Commits (a), (b) and (c) should go under separate commits so that the original
-   test script and the changes we have made are separated and clear.
+   Commits (a), (b) and (c) preferably should go under separate commits so that
+   the original test script and the changes we have made are separated and
+   clear. (a) and (b) can sometimes be combined into a single step.
 
    The test framework will then use your modified test script to run the test.
    No further changes would be needed. Please check the logs to make sure that
@@ -141,4 +164,4 @@ References:
 -----------
 .. [#a] https://blog.linuxplumbersconf.org/2011/ocw/system/presentations/867/original/bits.pdf
 .. [#b] https://www.youtube.com/watch?v=36QIepyUuhg
-
+.. [#c] https://fosdem.org/2024/schedule/event/fosdem-2024-2262-exercising-qemu-generated-acpi-smbios-tables-using-biosbits-from-within-a-guest-vm-/
-- 
2.42.0


