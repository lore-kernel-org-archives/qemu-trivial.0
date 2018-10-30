Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHS8h-0001bh-8m
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 07:24:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS8f-0001Yv-B1
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:24:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS8e-0002aj-Aj
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:24:49 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:55203)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gHS8K-00028S-2n; Tue, 30 Oct 2018 07:24:28 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MTzrW-1g9EeF45MQ-00QyF6; Tue, 30 Oct 2018 12:23:58 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MTzrW-1g9EeF45MQ-00QyF6; Tue, 30 Oct 2018 12:23:58 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>, qemu-trivial@nongnu.org,
	qemu-block@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org, Gerd Hoffmann <kraxel@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>, Markus Armbruster <armbru@redhat.com>
Date: Tue, 30 Oct 2018 12:23:23 +0100
Message-Id: <20181030112337.17973-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:JX1TAk6usLYJXFNrVTIYoQHw5D9Chnj+I/UQBtTU0G9hdMQz7Jy
	b5rAuOIuqcjCYOcSjc93W2rIyZdRwOjXgsFjjXcV4J8C9Jq3WWtP7cUTe+T3iyy57t1E3Mi
	dAsR0lZrFzkxht8M9XMYKWNd8SkohNvcycql/Zr1iVXcpFG2zDdS4hQM3mO6SDlL+E6/HBP
	kQSYMaMPIO/8Wm0OmhPbw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:WBgrBvfitp8=:57AUDuSR2bNYzP4Is4oH6a
	i3OZdim+pZaYSnKtxVH9SGrC2vbdg16XfHS6QDf/3yW1krjxpGcrxc0xFf0wrhO2T+k8gRFWE
	OnW8Hv4+HcYlc6+IQCwlqqmnfXr4mAI1xG4wyuaKTwRwGvvcUIXB0OgH34ObBDajQuR4zhQrA
	0niK2WEXNLVlL3blMoP+I9Xlnuo9KQ+BknzvaypRIZcjp8Fjtl2/QiTm8fq/zho2ROrqrgPiH
	V1AxzRiIBG9BIGsUqsHFW+bLStUDoF6HUOmIcgvNZgcU6NpAH2yiAfUUnFXYxDFoycc0PyshI
	/0BCOB3+Fp5FgzGv4g5MsLQmdDVEzZ82IcwwYka2W8FYqyqn6RhAJy3desNtagsF6/O/r536S
	eTqAEEEiUH5mQcuE3555yyt4nyJkPUVGRGnYf4gbGtq78PmdqGYwIeoav6oFvJ4ZfuF4x0qUR
	q4XJIh75DxWHeHgnD9BB4VdPy0Al9gWLLIXxXUAGMbWwfw3Aci0ortws0kh9sr5E/YUD2r3Bf
	DJim/JwUCMss27qVQbajjDjpFtT0MdXfa1P4A97HKtzrmGBF+MrD6v9vkuYObSOeKODiy4T+7
	g73ZlkTPR2/HRVO92SBW88yaxhBksi9C8HaXepAtMv/dzR2kVHEj0QwmtbuBebcgnu0Ru4PHC
	qlndKISTtt/EBtT7S80sdKC53duA+XHWIGSEKhJSW6ie4MjZTUeF2xCkYrU6fOhSodf7P/y/O
	dkzQBZd/E/Ik+QESooEDPrGI2KVapdzGLi2FTzWquVSyumS8+56iEiqXDjnAtKT1aza6VGvfX
	gZlc+FeSaS3ZpKJpfjhTQvDnqh1Uzu7/V/9uVUyZ3ELgyxBVCXB4ir3dQBsH04zBs0lxa6zlf
	KLwTJeYH5RXuKN1jn4L+N2FeoS6wg+2tu3I9DNxRM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: [Qemu-trivial] [PULL v2 06/20] docs/devel/testing.rst: add missing
 newlines after code block
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
X-List-Received-Date: Tue, 30 Oct 2018 11:24:50 -0000

From: Cleber Rosa <crosa@redhat.com>

The line immediate following a ".. code::" block is considered
to contains arguments to the "code directive".  The lack of a
new line gives me during at parse time:

   testing.rst:63: (ERROR/3) Error in "code" directive:
   maximum 1 argument(s) allowed, 3 supplied.

   .. code::
     make check-unit V=1

   testing.rst:120: (ERROR/3) Error in "code" directive:
   maximum 1 argument(s) allowed, 3 supplied.

   .. code::
     make check-qtest V=1

Let's add the missing newlines, both for consistency and to
avoid the parsing errors.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-Id: <20181004161852.11673-6-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 docs/devel/testing.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index fcfad87614..a227754f86 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -59,6 +59,7 @@ variable (which affects memory reclamation and catches invalid pointers better)
 and gtester options. If necessary, you can run
 
 .. code::
+
   make check-unit V=1
 
 and copy the actual command line which executes the unit test, then run
@@ -116,6 +117,7 @@ and using gdb on the test is still simple to do: find out the actual command
 from the output of
 
 .. code::
+
   make check-qtest V=1
 
 which you can run manually.
-- 
2.17.2


