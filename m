Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0Ofm-0005jI-ER
	for mharc-qemu-trivial@gnu.org; Wed, 21 Aug 2019 07:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53696)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i0OfV-0005BE-Vj
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:20:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i0OfU-0006ge-Me
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:20:45 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:53255)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1i0Oey-0006KI-Fd; Wed, 21 Aug 2019 07:20:12 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M6EOc-1hto1S1adU-006hG6; Wed, 21 Aug 2019 13:20:02 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Corey Minyard <minyard@acm.org>,
 Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 Michal Privoznik <mprivozn@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Wed, 21 Aug 2019 13:19:38 +0200
Message-Id: <20190821111947.26580-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821111947.26580-1-laurent@vivier.eu>
References: <20190821111947.26580-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qzR5HNnO6FY7LGx0tZ0b6gMXbFXJvxbxC156Z+PBSbIxM+DXenD
 YUNVZX3yOe4338y5su+c7Y2AbEE3LqLKqc3aoz3prxZMjA+m6A5XEXpiNTGx5yHz0OSvNpf
 K4W2W5g5oBq3PBYnDx++LqqUdbWR0No6faQiChNygLJwIvKbFAr3vfwHob6cVqn6BlVSgAu
 8XzTBpNY1GAPXorywxN7Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:U928ZJdrwHE=:vlZvRbvlAJUrfcrRTtoV7P
 Y6TKwYAWp0qZenfkVEVlU/Y+Q9mOH1eNUvWtyzr1HwZIMFA8zlqxAXceMSTeOdnKldVkThGub
 bGrXhU0lVM+evvYUBpgrInf7Cl3thPtLkUbNS/pn+AvMupQRBf7QE4ZbTOH8z1eKBEcrpI6Wp
 1D19HvETiZ9JHGl/7Dv1nYQk7UyAu0lSTweb95GuMIcHhhdp9JSfrwmPkWUkyZZLBMUSEe3/X
 I0Yw4BbqRfT/3V5C6FGQtdNxe0bfaZ8lBmJrBq/70Y3ksxogY55yEQdpUOc7d42Li68KL6Wmo
 Rk35szsMKdnEWdAj+ZswvzTePvRv8uECkvZPwRJpOFI5ru4ZvxYrv/nAIVIpQM2kVQNTHwkN/
 MubdEWWimn0TCyZvMw/bm6zmuiv7fsTYhxlO4di5FPXBWA5dlVAwZ2HKDmPkcJ/VjX23hHlo7
 BngVyUgYtlYcLzr7HqR805jR6xcuuOcGyr42J6O+5T6D4Xj053ronssbip6xeNgV5b5e9+N1u
 /35q5+5t+6T4Ob/x8PwN0xqnjnavGLSp/SRKn8NY9tujweewa8fWKjC/J8OxZLWjg+CU9I6ZX
 4765MiiEZ7n10Iootlu7B1DnuhOSaRZ+3CtgI8Tnrg7KfwS2WD0hLx5i4nEXZtHgC4C3U53Mc
 idyILR3iV3lOFNBtkK7hxMp3e7Yt7EA0Q0r0nBSj5vH0+t/uSG78unKDQWVny/7M0cb5Xa01q
 UcROufOUnraJqSv9gflcHcH6n2rAKzduV+wZZDTmbBzYcTVb7V2mv1ProG8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: [Qemu-trivial] [PULL 05/14] .gitignore: ignore some vhost-user*
 related files
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
X-List-Received-Date: Wed, 21 Aug 2019 11:20:48 -0000

From: Michal Privoznik <mprivozn@redhat.com>

Commit d52c454aadc creates
'/contrib/vhost-user-gpu/50-qemu-gpu.json' and '/vhost-user-gpu'
and commit 06914c97d3a creates '/vhost-user-input' neither of
which is ignored by git.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <db150a03315a89a849ab9968e4a5a26110d41424.1562942402.git.mprivozn@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 .gitignore | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.gitignore b/.gitignore
index fd6e6c38c7b9..e9bbc006d39e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -65,6 +65,8 @@
 /scsi/qemu-pr-helper
 /vhost-user-scsi
 /vhost-user-blk
+/vhost-user-gpu
+/vhost-user-input
 /fsdev/virtfs-proxy-helper
 *.tmp
 *.[1-9]
@@ -131,6 +133,7 @@
 /docs/interop/qemu-qmp-ref.info*
 /docs/interop/qemu-qmp-ref.txt
 /docs/version.texi
+/contrib/vhost-user-gpu/50-qemu-gpu.json
 *.tps
 .stgit-*
 .git-submodule-status
-- 
2.21.0


